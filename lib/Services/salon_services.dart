import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class SalonServices {
  final String apiKey = "AIzaSyAWgL-5xqdWuhvWubWGpZ5aFYJvZs46ozw";
  Future<List<Map<String, dynamic>>> fetchSalons(
      double latitude, double longitude) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=5000&type=beauty_salon&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> popularSalons = [];
      for (var result in data['results']) {
        if (result['rating'] != null && result['rating'] >= 4.5) {
          popularSalons.add({
            'name': result['name'],
            'address': result['vicinity'],
            'location': {
              'latitude': result['geometry']['location']['lat'],
              'longitude': result['geomtry']['loaction']['lng'],
            },
            'rating': result['rating'],
            'reviews': result['user_rating_total'] ?? 0,
            'image_url': result['photos'] != null
                ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${result['photos'][0]['photo_reference']}&key=$apiKey'
                : null
          });
        }
      }
      return popularSalons;
    } else {
      throw Exception('Failed to fetch Popular Salons');
    }
  }

// Save Saloms to Firebase firestore
  Future<void> saveSalonsToFirebase(List<Map<String, dynamic>> salons) async {
    final CollectionReference popularSalonsCollection =
        FirebaseFirestore.instance.collection("popular_salon");

    for (var salon in salons) {
      try {
        await popularSalonsCollection.add(salon);
      } catch (e) {
        throw Exception("Error Saving Popular Salon: $e");
      }
    }
  }

  // Retrieve Popular Salons
  Future<List<Map<String, dynamic>>> getPopularSalons() async {
    final CollectionReference popularSalonsCollection =
        FirebaseFirestore.instance.collection("popular_salons");

    QuerySnapshot snapshot = await popularSalonsCollection
        .orderBy('rating', descending: true)
        .orderBy('reviews', descending: true)
        .get();

    List<Map<String, dynamic>> salons = [];

    for (var doc in snapshot.docs) {
      salons.add(doc.data() as Map<String, dynamic>);
    }

    return salons;
  }
}
