import 'package:barbers_app/Constants/colors.dart';
import 'package:barbers_app/Constants/fonts_style.dart';
import 'package:barbers_app/Utils/services_image_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/title_rows.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: height / 14,
        right: width / 21,
        left: width / 21,
      ),
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
            height: 25,
          ),
          Text("Hi, Umar",
              style: AppStyles.h2(
                color: AppColors.textPrimary,
              )),
          const SizedBox(
            height: 15,
          ),
          // Location
          Row(
            children: [
              const Icon(
                FluentIcons.location_24_regular,
                color: Color(0xffABAAB1),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "6391 Elgin St. Celina, Delaware 10299",
                style: AppStyles.t3Small(color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
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
                  titleData: '"Today , Morning"',
                  title: 'Appointments',
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: height / 12,
                  decoration: BoxDecoration(
                    color: const Color(0xff6D5AE6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/Icons/calendar white.svg",
                            width: 22, height: 22),
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
            height: 5,
          ),
          // Services
          const Column(
            children: [
              TitleRows(title: "Services", titleData: "View All"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServicesImageSlider(
                      assetName: 'assets/Images/Haircuts.svg',
                      title: 'Hair Cuts',
                    ),
                    ServicesImageSlider(
                      assetName: 'assets/Images/Skin Care.svg',
                      title: 'Skin Care',
                    ),
                    ServicesImageSlider(
                      assetName: 'assets/Images/Hair Color.svg',
                      title: 'Hair Color',
                    ),
                    ServicesImageSlider(
                      assetName: 'assets/Images/Massage.svg',
                      title: 'Massage',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Nearest Salon
          const TitleRows(title: "Nearest Salon", titleData: "View All"),
          const SizedBox(
            height: 5,
          ),
          // Popular Salon
          const TitleRows(title: "Popular Salon", titleData: "View All"),
        ],
      ),
    );
  }
}
