import 'dart:ui';
import 'package:barbar/Components/custom_search_textfield.dart';
import 'package:barbar/Components/enable_location.dart';
import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomSearchTextfield(
                  title: 'Search Salon',
                  height: 57,
                  width: width,
                  onPressed: () {},
                  controller: searchController,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          if (location.isBlurred)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color:
                      Colors.black.withOpacity(0.5), // semi-transparent overlay
                ),
              ),
            ),
          if (!location.isLocationEnabled) const EnableLocationContainer(),
        ],
      ),
    );
  }
}
