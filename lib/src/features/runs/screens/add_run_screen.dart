import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:run_tracker_flutter/src/core/models/run_model.dart';
import 'package:run_tracker_flutter/src/core/services/geocode_services.dart';
import 'package:run_tracker_flutter/src/core/services/storage_service.dart';
import 'package:run_tracker_flutter/src/features/runs/bloc/runs_bloc.dart';
import 'package:run_tracker_flutter/src/features/runs/widgets/run_form_fields.dart';

class AddRunScreen extends StatefulWidget {
  const AddRunScreen({super.key});

  @override
  State<AddRunScreen> createState() => _AddRunScreenState();
}

class _AddRunScreenState extends State<AddRunScreen> {
  final _formKey = GlobalKey<FormState>();
  final _distanceController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();
  final GeocodeServices _geocodeServices = GeocodeServices();
  final _picker = ImagePicker();

  File? _selectedImage;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source, imageQuality: 70);
      if (pickedFile != null) {
        setState(() => _selectedImage = File(pickedFile.path));
      }
    } catch (e) {
      _showSnackBar('Error picking image: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await _geocodeServices.getCurrentPosition();
      final address = await _geocodeServices.getAddressFromCoordinates(position);
      if (mounted) _locationController.text = address;
    } catch (e) {
      _showSnackBar('Could not get location: $e');
    }
  }

  Future<List<String>> _searchPlaces(String query) async {
    try {
      return await _geocodeServices.searchPlaces(query);
    } catch (_) {
      return [];
    }
  }

  void _showLocationSearchBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        List<String> results = [];

        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Search location',
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (value) async {
                          final res = await _searchPlaces(value);
                          if (context.mounted) setModalState(() => results = res);
                        },
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: results.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(results[index]),
                              onTap: () {
                                _locationController.text = results[index];
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() != true || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    try {
      final distance = double.tryParse(_distanceController.text.trim()) ?? 0.0;
      final time = double.tryParse(_timeController.text.trim()) ?? 0.0;
      final location = _locationController.text.trim();

      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated.');

      String? imageUrl;
      if (_selectedImage != null) {
        imageUrl = await StorageService().uploadRunPhoto(
          file: _selectedImage!,
          userId: userId,
        );
      }

      final run = RunModel(
        id: '',
        distance: distance,
        duration: time.toInt(),
        location: location,
        date: DateTime.now(),
        photoUrl: imageUrl,
        startPoint: null,
      );

      if (mounted) {
        context.read<RunsBloc>().add(RunsEvent.addRun(run));
        _showSnackBar('Run saved successfully');
        _resetForm();
      }
    } catch (e) {
      _showSnackBar('Failed to save run: $e');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _locationController.clear();
    _distanceController.clear();
    _timeController.clear();
    setState(() => _selectedImage = null);
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _distanceController.dispose();
    _timeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RunsBloc, RunsState>(
      listener: (context, state) {
        if (state is RunsError) {
          _showSnackBar(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Run'), centerTitle: true),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildFormFieldsCard(),
                const SizedBox(height: 16),
                _buildLocationFieldCard(),
                const SizedBox(height: 16),
                _buildPhotoPreview(),
                const SizedBox(height: 12),
                _buildPhotoButtons(),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _isSubmitting ? null : _submitForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Run'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFieldsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RunFormFields(
              controller: _distanceController,
              keyboardType: TextInputType.number,
              label: 'Distance (km)',
              hintText: 'e.g. 5.0',
              validator: (value) => value == null || value.isEmpty ? 'Enter distance' : null,
            ),
            const SizedBox(height: 12),
            RunFormFields(
              controller: _timeController,
              keyboardType: TextInputType.number,
              label: 'Time (minutes)',
              hintText: 'e.g. 30',
              validator: (value) => value == null || value.isEmpty ? 'Enter time' : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationFieldCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  hintText: 'Current or custom location',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.my_location),
              tooltip: 'Use current location',
              onPressed: _getCurrentLocation,
            ),
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search location',
              onPressed: _showLocationSearchBottomSheet,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoPreview() {
    return _selectedImage != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              _selectedImage!,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        : const Text('No photo selected');
  }

  Widget _buildPhotoButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton.icon(
          onPressed: () => _pickImage(ImageSource.camera),
          icon: const Icon(Icons.camera_alt),
          label: const Text("Camera"),
        ),
        OutlinedButton.icon(
          onPressed: () => _pickImage(ImageSource.gallery),
          icon: const Icon(Icons.photo_library),
          label: const Text("Gallery"),
        ),
      ],
    );
  }
}
