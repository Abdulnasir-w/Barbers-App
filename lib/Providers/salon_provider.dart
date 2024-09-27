import 'package:barbar/Services/salon_services.dart';
import 'package:barbar/Utils/distance_calculation.dart';
import 'package:flutter/material.dart';

class SalonProvider with ChangeNotifier {
  List<Map<String, dynamic>> _popularSalons = [];
  List<Map<String, dynamic>> nearestSalons = [];
  bool _isLoading = false;
  final SalonServices salonServices = SalonServices();

  List<Map<String, dynamic>> get popularSalons => _popularSalons;
  bool get isLoading => _isLoading;

  Future<void> fetchAndSavePopularSalons(
      double latitude, double longitude) async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Map<String, dynamic>> salons =
          await salonServices.fetchSalons(latitude, longitude);
      await salonServices.saveSalonsToFirebase(salons);
      _popularSalons = salons;
    } catch (e) {
      throw Exception("Error Fetching and Save Popular Salons: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch popular salons from Firebase and notify listeners
  Future<void> loadPopularSalonsFromFirebase() async {
    _isLoading = true;
    notifyListeners();

    try {
      _popularSalons = await salonServices.getPopularSalons();
    } catch (e) {
      print('Error loading popular salons from Firebase: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadNearestSalons(double? userLat, double? userLon) async {
    await loadPopularSalonsFromFirebase();

    nearestSalons = popularSalons.where((salon) {
      double salonLat = salon['latitude'];
      double salonLon = salon['longitude'];
      double distance =
          distanceCalculation(userLat!, userLon!, salonLat, salonLon);
      return distance <= 5;
    }).toList();
    notifyListeners();
  }
}
