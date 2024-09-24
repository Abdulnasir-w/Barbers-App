import 'package:barbar/Constants/fonts_style.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class PopularSalonTile extends StatelessWidget {
  final String asset;
  const PopularSalonTile({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          asset,
          width: 96,
          height: 90,
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
      title: Text(
        "Green Apple",
        style: AppStyles.t1(color: AppColors.textPrimary),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "6391 Elgin St. Celina, Delaware ...",
            style: AppStyles.t3Small(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Row(
                children: [
                  const Icon(
                    FluentIcons.location_12_regular,
                    color: AppColors.textPrimary,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "5 KM",
                    style: AppStyles.t3Small(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
