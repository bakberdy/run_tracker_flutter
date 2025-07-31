import 'package:latlong2/latlong.dart';

class RunModel {
  final String id;
  final DateTime date;
  final String location;
  final double distance; // in km
  final int duration; // in minutes
  final String? photoUrl;
  final LatLng? startPoint;

  RunModel({
    required this.id,
    required this.date,
    required this.location,
    required this.distance,
    required this.duration,
    this.photoUrl,
    this.startPoint,
  });

  double get pace => distance > 0 ? duration / distance : 0;

  factory RunModel.empty() {
    return RunModel(
      id: '0',
      date: DateTime.now(),
      location: 'Almaty, Kazakhstan',
      distance: 0.0,
      duration: 0,
      photoUrl: 'https://placehold.co/600x400.png',
      startPoint: null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'location': location,
      'distance': distance,
      'duration': duration,
      'photoUrl': photoUrl,
      'startPoint': startPoint != null
          ? {'lat': startPoint!.latitude, 'lng': startPoint!.longitude}
          : null,
    };
  }

  factory RunModel.fromMap(String id, Map<String, dynamic> map) {
    return RunModel(
      id: id,
      date: DateTime.parse(map['date']),
      location: map['location'] ?? '',
      distance: (map['distance'] as num).toDouble(),
      duration: (map['duration'] as num).toInt(),
      photoUrl: map['photoUrl'],
      startPoint: map['startPoint'] != null
          ? LatLng(
              (map['startPoint']['lat'] as num).toDouble(),
              (map['startPoint']['lng'] as num).toDouble(),
            )
          : null,
    );
  }
}
