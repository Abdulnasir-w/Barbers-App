import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Constants/fonts_style.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class NearestImageSlider extends StatelessWidget {
  final String assetName;
  const NearestImageSlider({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.829,
      height: height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Image.asset(
            assetName,
            fit: BoxFit.fill,
            width: 318,
            height: 112,
          ),
          const SizedBox(
            height: 7,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bella Rinova",
                      style: AppStyles.t1(color: AppColors.textPrimary),
                    ),
                    const SizedBox(
                      width: 115,
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        int rating = 4;
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 12,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "6391 Elgin St. Celina, Delaware 1...",
                      style: AppStyles.t3Small(color: AppColors.textSecondary),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          FluentIcons.location_12_regular,
                          color: AppColors.textPrimary,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "5 KM",
                          style: AppStyles.t3Small(
                            color: AppColors.textPrimary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
