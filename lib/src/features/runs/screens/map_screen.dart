import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  final String locationName;

  const MapScreen({super.key, required this.locationName});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? coordinates;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoordinates();
  }

  Future<void> _fetchCoordinates() async {
    final url = Uri.parse(
      "https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(widget.locationName)}&format=json&limit=1",
    );

    final response = await http.get(url, headers: {
      'User-Agent': 'FlutterRunTrackerApp/1.0',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        setState(() {
          coordinates = LatLng(lat, lon);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Местоположение не найдено')),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ошибка загрузки карты')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.locationName)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : coordinates == null
              ? const Center(child: Text('Не удалось загрузить координаты'))
              : FlutterMap(
                  options: MapOptions(
                    initialCenter: coordinates??LatLng(43.238949, 76.889709),
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: coordinates!,
                          width: 40,
                          height: 40,
                          child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }
}
