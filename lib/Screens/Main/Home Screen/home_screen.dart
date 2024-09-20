import 'package:barbers_app/Screens/Main/Home%20Screen/nearest_image_slider.dart';
import 'package:barbers_app/Constants/colors.dart';
import 'package:barbers_app/Constants/fonts_style.dart';
import 'package:barbers_app/Screens/Main/Home%20Screen/popular_salon_tile.dart';
import 'package:barbers_app/Screens/Main/Home%20Screen/services_image_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'title_rows.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          top: height / 14, right: width / 21, left: width / 21, bottom: 10),
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
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black45),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/Icons/bell.svg",
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black45),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/Icons/search.svg",
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
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
                          SvgPicture.asset("assets/Icons/calendar white.svg",
                              width: 23, height: 23),
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
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ServicesImageSlider(
                          assetName:
                              'assets/Images/Services Salon/Skin Care.png',
                          title: 'Skin Care',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ServicesImageSlider(
                          assetName:
                              'assets/Images/Services Salon/Hair Color.png',
                          title: 'Hair Color',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ServicesImageSlider(
                          assetName: 'assets/Images/Services Salon/Massage.png',
                          title: 'Massage',
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
            const Column(
              children: [
                TitleRows(title: "Nearest Salon", titleData: "View All"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      children: [
                        NearestImageSlider(
                          assetName:
                              'assets/Images/Nearest Salon/Bella Rinova.png',
                        ),
                        NearestImageSlider(
                          assetName:
                              'assets/Images/Nearest Salon/Bella Rinova.png',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleRows(title: "Popular Salon", titleData: "View All"),
                SizedBox(
                  height: 200,
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
    );
  }
}
