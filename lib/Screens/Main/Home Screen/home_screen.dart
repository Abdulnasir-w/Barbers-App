import 'dart:ui';

import 'package:barbar/Components/enable_location.dart';
import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Constants/fonts_style.dart';
import 'package:barbar/Providers/location_provider.dart';
import 'package:barbar/Providers/salon_provider.dart';
import 'package:barbar/Screens/Main/Home%20Screen/appBar_icons.dart';
import 'package:barbar/Screens/Main/Home%20Screen/nearest_image_slider.dart';
import 'package:barbar/Screens/Main/Home%20Screen/popular_salon_tile.dart';
import 'package:barbar/Screens/Main/Home%20Screen/services_image_slider.dart';
import 'package:barbar/Screens/Main/search_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'title_rows.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadSalons();
  }

  void _loadSalons() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    double? userLat = locationProvider.latitude;
    double? userLon = locationProvider.longitude;

    final salonProvider = Provider.of<SalonProvider>(context, listen: false);

    // Defer the loading of salons to after the build completes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      salonProvider.loadNearestSalons(userLat, userLon);
    });
  }

  @override
  Widget build(BuildContext context) {
    final salonProvider = Provider.of<SalonProvider>(context, listen: false);
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              top: height / 20,
              right: width / 21,
              left: width / 21,
              bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/profile.svg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const AppbarIcons(
                          assets: "assets/Icons/bell.svg",
                        ),
                        const SizedBox(width: 10),
                        AppbarIcons(
                          assets: "assets/Icons/search.svg",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("Hi, Umar",
                    style: AppStyles.h2(
                      color: AppColors.textPrimary,
                    )),
                const SizedBox(
                  height: 3,
                ),
                // Location
                Row(
                  children: [
                    const Icon(
                      FluentIcons.location_20_regular,
                      color: Color(0xffABAAB1),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "6391 Elgin St. Celina, Delaware 10299",
                      style: AppStyles.t3Small(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // Appointments
                Container(
                  width: width * 1.2,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const TitleRows(
                        titleData: 'Today , Morning',
                        title: 'Appointments',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: width,
                        height: height / 12,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                  "assets/Icons/calendar white.svg",
                                  width: 23,
                                  height: 23),
                              Text(
                                "At The Galleria Hair Salon",
                                style: AppStyles.t3Small(
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                              Text(
                                "9 : 00 AM",
                                style: AppStyles.t3Small(
                                    color: AppColors.backgroundColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                // Services
                const Column(
                  children: [
                    TitleRows(title: "Services", titleData: "View All"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ServicesImageSlider(
                              assetName:
                                  'assets/Images/Services Salon/Haircuts.png',
                              title: 'Hair Cuts',
                              width: 96,
                              height: 103,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ServicesImageSlider(
                              assetName:
                                  'assets/Images/Services Salon/Skin Care.png',
                              title: 'Skin Care',
                              width: 96,
                              height: 103,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ServicesImageSlider(
                              assetName:
                                  'assets/Images/Services Salon/Hair Color.png',
                              title: 'Hair Color',
                              width: 96,
                              height: 103,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ServicesImageSlider(
                              assetName:
                                  'assets/Images/Services Salon/Massage.png',
                              title: 'Massage',
                              width: 96,
                              height: 103,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                // Nearest Salon
                Column(
                  children: [
                    TitleRows(title: "Nearest Salon", titleData: "View All"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Row(
                          children: salonProvider.nearestSalons.map((salon) {
                            print("Image Url :::: ${salon['image_url']}");
                            return NearestImageSlider(
                              assetName: salon['image_url'] ??
                                  'assets/placeholder.png',
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleRows(
                        title: "Popular Salon", titleData: "View All"),
                    SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(5, (index) {
                            return const PopularSalonTile(
                              asset: "assets/Images/Salons/Green Apple.png",
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        // Blur the background if location is not enabled
        if (locationProvider.isBlurred)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color:
                    Colors.black.withOpacity(0.5), // semi-transparent overlay
              ),
            ),
          ),
        if (!locationProvider.isLocationEnabled)
          const EnableLocationContainer(),
      ],
    );
  }
}
