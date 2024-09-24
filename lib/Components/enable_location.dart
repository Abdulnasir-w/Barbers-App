import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Constants/fonts_style.dart';
import 'package:barbar/Providers/location_provider.dart';

class EnableLocationContainer extends StatelessWidget {
  const EnableLocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 408,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              "Enable Location",
              style: AppStyles.h4(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 20),
            SvgPicture.asset(
              "assets/location.svg",
              width: 95,
              height: 102,
            ),
            const SizedBox(height: 20),
            Text(
              "We need to know your location in order \n to suggest nearby services.",
              style: AppStyles.t3Small(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              width: 173,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryColor,
              ),
              child: TextButton(
                onPressed: () {
                  locationProvider.enableLocation(context);
                },
                child: Text(
                  "Enable",
                  style: AppStyles.t2(
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
