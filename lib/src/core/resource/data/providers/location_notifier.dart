import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:base/src/core/resource/data/db/shared_preferences.dart';
import 'package:base/src/core/resource/domain/models/latlng.dart';

/// `LocationNotifier` - This class contains `Location provider` for locale feature.

class LocationNotifier extends ChangeNotifier {
  LatLng? _location;

  Future<LatLng?> getCurrentLocation() async {
    if (_location != null) {
      return _location!;
    } else {
      final permission = await Geolocator.checkPermission();
      final List<LocationPermission> permissions = [
        LocationPermission.denied,
        LocationPermission.deniedForever,
        LocationPermission.unableToDetermine,
      ];
      if (permissions.contains(permission)) {
        await Geolocator.requestPermission().then((value) async {
          final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!isLocationServiceEnabled) {
            return null;
          }
          final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          final location = LatLng(
            latitude: position.latitude,
            longitude: position.longitude,
          );
          sharedPreference.setLocation(location);
          _location = location;
          notifyListeners();
          return location;
        });
      }
      final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        return null;
      } else {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        final location = LatLng(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        _location = location;
        notifyListeners();
        return location;
      }
    }
  }
}
