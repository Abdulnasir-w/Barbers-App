import 'package:barbar/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constants/fonts_style.dart';

class CustomSearchTextfield extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final TextEditingController controller;
  const CustomSearchTextfield({
    super.key,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.controller,
  });

  @override
  State<CustomSearchTextfield> createState() => _CustomSearchTextfieldState();
}

class _CustomSearchTextfieldState extends State<CustomSearchTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width, // Set the width
      height: widget.height, // Set the height

      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF8F8F8),
          hintText: widget.title,
          hintStyle: AppStyles.t3Regular(
            color: AppColors.textPrimary,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              "assets/Icons/search grey.svg",
              width: 20,
              height: 20,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: widget.onPressed,
              child: SvgPicture.asset(
                "assets/Icons/filter.svg",
                width: 20,
                height: 20,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
