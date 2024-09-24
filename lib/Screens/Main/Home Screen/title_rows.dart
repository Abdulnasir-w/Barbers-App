import 'package:barbar/Constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../Constants/fonts_style.dart';

class TitleRows extends StatelessWidget {
  final String title;
  final String titleData;
  const TitleRows({
    super.key,
    required this.title,
    required this.titleData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.h5(color: AppColors.textPrimary),
          ),
          Text(
            titleData,
            style: AppStyles.t3Regular(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
