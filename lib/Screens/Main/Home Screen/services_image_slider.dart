import 'package:barbers_app/Constants/colors.dart';
import 'package:barbers_app/Constants/fonts_style.dart';
import 'package:flutter/material.dart';

class ServicesImageSlider extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final String assetName;
  const ServicesImageSlider({
    super.key,
    required this.assetName,
    required this.title,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width, //96
          height: height, //103
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(
            assetName,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.t3Small(
              color: AppColors.textPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
