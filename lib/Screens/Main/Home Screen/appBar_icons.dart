import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarIcons extends StatelessWidget {
  final String assets;
  final VoidCallback? onPressed;
  const AppbarIcons({
    super.key,
    required this.assets,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black45),
        ),
        child: Center(
          child: SvgPicture.asset(
            assets,
            width: 18,
            height: 18,
          ),
        ),
      ),
    );
  }
}
