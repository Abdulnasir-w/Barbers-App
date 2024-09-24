import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Constants/fonts_style.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class Filter {
  static void showFilterBottomSheet(
    BuildContext context, {
    required Function(List<String> selectServices, double minRating,
            String gender, double distance)
        onApplyFilters,
    double initialDistance = 5.0,
  }) {
    // List to hold selected filters
    List<String> selectedServices = [];
    double selectedRating = 1.0; // Default to 1+ Stars
    String selectedGender = 'All'; // Default to all genders
    double currentSliderValue = initialDistance;

    showModalBottomSheet(
        backgroundColor: AppColors.backgroundColor,
        enableDrag: true,
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            final width = MediaQuery.of(context).size.width;
            final height = MediaQuery.of(context).size.height;

            return SizedBox(
              width: width * 0.99,
              height: height * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/Icons/filter.svg",
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text("Filter ",
                            style: AppStyles.h5(color: AppColors.textPrimary)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Services : ",
                        style: AppStyles.t1(color: AppColors.textPrimary)),
                    const SizedBox(
                      height: 6,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          filterChips("Hair Cut", selectedServices, setState),
                          const SizedBox(
                            width: 5,
                          ),
                          filterChips("Make up", selectedServices, setState),
                          const SizedBox(
                            width: 5,
                          ),
                          filterChips("Massage", selectedServices, setState),
                          const SizedBox(
                            width: 5,
                          ),
                          filterChips("Mani Cure", selectedServices, setState),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Rating : ",
                        style: AppStyles.t1(color: AppColors.textPrimary)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: selectedRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 24.0,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            FluentIcons.star_12_filled,
                            size: 16,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              selectedRating = rating;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text('${selectedRating.toString()}   Stars',
                            style: AppStyles.t3Regular(
                                color: AppColors.textPrimary))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Gender : ",
                        style: AppStyles.t1(color: AppColors.textPrimary)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        buildGenderChip("All", selectedGender, (newGender) {
                          setState(() {
                            selectedGender = newGender;
                          });
                        }),
                        const SizedBox(
                          width: 10,
                        ),
                        buildGenderChip("Man", selectedGender, (newGender) {
                          setState(() {
                            selectedGender = newGender;
                          });
                        }),
                        const SizedBox(
                          width: 10,
                        ),
                        buildGenderChip("Woman", selectedGender, (newGender) {
                          setState(() {
                            selectedGender = newGender;
                          });
                        }),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Distance : ",
                        style: AppStyles.t1(color: AppColors.textPrimary)),
                    const SizedBox(
                      height: 10,
                    ),
                    Slider(
                      value: currentSliderValue,
                      min: 0.0,
                      max: 50.0,
                      divisions: 50,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.secondryGreyColor,
                      thumbColor: AppColors.backgroundColor,
                      overlayColor:
                          const WidgetStatePropertyAll(AppColors.primaryColor),
                      label: "${currentSliderValue.toStringAsFixed(1)} KM",
                      allowedInteraction: SliderInteraction.tapAndSlide,
                      onChanged: (value) {
                        setState(() {
                          currentSliderValue = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 315,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primaryColor),
                        child: TextButton.icon(
                          onPressed: () {
                            onApplyFilters(
                              selectedServices,
                              selectedRating,
                              selectedGender,
                              currentSliderValue,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                backgroundColor: AppColors.textSecondary,
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  "Filters Apply Successfully",
                                  style: AppStyles.t3Small(
                                      color: AppColors.backgroundColor),
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            FluentIcons.checkmark_16_regular,
                            color: AppColors.backgroundColor,
                            size: 20,
                          ),
                          label: Text(
                            "Apply Filters",
                            style: AppStyles.button(
                                color: AppColors.backgroundColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

// Chips
  static Widget filterChips(
      String label, List<String> selectedServices, StateSetter setState) {
    bool isSelected = selectedServices.contains(label);
    return FilterChip(
      backgroundColor: const Color(0xFFF8F8F8),
      side: BorderSide.none,
      checkmarkColor: AppColors.backgroundColor,
      chipAnimationStyle: ChipAnimationStyle(
          enableAnimation: AnimationStyle(curve: Curves.bounceOut),
          selectAnimation: AnimationStyle(curve: Curves.easeIn),
          deleteDrawerAnimation: AnimationStyle(curve: Curves.easeOutCubic)),
      label: Text(
        label,
        style: isSelected
            ? AppStyles.t3Small(
                color: AppColors.backgroundColor,
              )
            : AppStyles.t3Small(color: AppColors.textColor),
      ),
      selected: isSelected,
      selectedColor:
          isSelected ? AppColors.primaryColor : const Color(0xFFF8F8F8),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedServices.add(label);
          } else {
            selectedServices.remove(label);
          }
        });
      },
    );
  }

  static Widget buildGenderChip(
      String label, String selectedGender, ValueChanged<String> onSelected) {
    bool isSelected = selectedGender == label;
    return FilterChip(
      backgroundColor: const Color(0xFFF8F8F8),
      side: BorderSide.none,
      checkmarkColor: AppColors.backgroundColor,
      label: Text(
        label,
        style: isSelected
            ? AppStyles.t3Small(color: AppColors.backgroundColor)
            : AppStyles.t3Small(color: AppColors.textColor),
      ),
      selected: isSelected,
      selectedColor:
          isSelected ? AppColors.primaryColor : const Color(0xFFF8F8F8),
      onSelected: (bool selected) {
        if (selected) {
          onSelected(label); // Call the callback to update the gender
        }
      },
    );
  }
}
