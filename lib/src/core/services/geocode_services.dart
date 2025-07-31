import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class GeocodeServices {
  Future<LatLng?> getCoordinatesFromAddress(String locationName) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?q=$locationName&format=json&limit=1',
    );

    final res = await http.get(
      url,
      headers: {
        'User-Agent': 'FlutterRunTrackerApp/1.0',
      },
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List;
      if (data.isNotEmpty) {
        final lat = double.tryParse(data[0]['lat']);
        final lon = double.tryParse(data[0]['lon']);
        if (lat != null && lon != null) {
          return LatLng(lat, lon);
        }
      }
      return null;
    } else {
      throw Exception('Failed to get coordinates');
    }
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromCoordinates(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) return 'Unknown location';

    final placemark = placemarks.first;
    return [
      placemark.street,
      placemark.locality,
      placemark.administrativeArea,
      placemark.country,
    ].where((part) => part != null && part.isNotEmpty).join(', ');
  }

  /// Поиск адресов по строке запроса (используется Nominatim API)
  Future<List<String>> searchPlaces(String query) async {
    final url = Uri.parse(
      "https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=10",
    );
    final res = await http.get(
      url,
      headers: {
        'User-Agent': 'FlutterRunTrackerApp/1.0', // важно для Nominatim
      },
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List;
      return data
          .map((e) => e['display_name'] as String)
          .cast<String>()
          .toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
