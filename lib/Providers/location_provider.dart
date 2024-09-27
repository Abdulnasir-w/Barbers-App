import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Constants/fonts_style.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LocationProvider extends ChangeNotifier {
  bool _isLocationEnabled = false;
  bool _isBlurred = true;
  Timer? _locationCheckTimer;

  double? _latitude;
  double? _longitude;

  bool get isLocationEnabled => _isLocationEnabled;
  bool get isBlurred => _isBlurred;

  double? get latitude => _latitude;
  double? get longitude => _longitude;

  LocationProvider() {
    _checkLocationStatus();
    _startLocationCheck();
  }

  void _startLocationCheck() {
    _locationCheckTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      await _checkLocationStatus();
    });
  }

  Future<void> _checkLocationStatus() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (serviceEnabled &&
        (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse)) {
      _isLocationEnabled = true;
      _isBlurred = false;
      await _getCurrentLocation(); // Get current location
    } else {
      _isLocationEnabled = false;
      _isBlurred = true;
    }

    notifyListeners();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);
      _latitude = position.latitude;
      _longitude = position.longitude;
      notifyListeners(); // Notify listeners to update the UI with the new location
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  Future<void> enableLocation(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Location permissions are denied',
              style: AppStyles.t3Small(color: AppColors.backgroundColor),
            ),
            backgroundColor: AppColors.primaryColor,
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Location permissions are permanently denied',
            style: AppStyles.t3Small(color: AppColors.backgroundColor),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
      );
      return;
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      _isLocationEnabled = true;
      _isBlurred = false;
      await _getCurrentLocation(); // Get current location after enabling
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _locationCheckTimer?.cancel();
    super.dispose();
  }
}
