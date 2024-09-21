import 'package:barbers_app/Constants/colors.dart';
import 'package:barbers_app/Constants/fonts_style.dart';
import 'package:barbers_app/Screens/Main/Home%20Screen/services_image_slider.dart';
import 'package:barbers_app/Screens/Main/filter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/custom_search_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedTab = 'All';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomSearchTextfield(
                  title: 'Search Salon',
                  height: 57,
                  width: width,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Filter()));
                  },
                  controller: searchController,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                iconSize: 36,
                icon: SvgPicture.asset(
                  "assets/Icons/close.svg",
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTabBar(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Popular Artists",
              style: AppStyles.h5(color: AppColors.textPrimary),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildPopularArtists(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Result Found (296)",
              style: AppStyles.h5(color: AppColors.textPrimary),
            ),
            _buildSalonListTile("assets/Images/Salons/Bella Rinova.png"),
            _buildSalonListTile("assets/Images/Salons/Green Apple.png"),
            _buildSalonListTile("assets/Images/Salons/Rivona Bella.png")
          ],
        ),
      ),
    );
  }

  // Tab bar widget
  Widget _buildTabBar() {
    return DefaultTabController(
      length: 5,
      child: TabBar(
        dividerHeight: 0,
        isScrollable: true,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: Colors.grey,
        indicatorColor: AppColors.primaryColor,
        tabAlignment: TabAlignment.center,
        onTap: (index) {
          setState(() {
            selectedTab = getTabName(index);
          });
        },
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Haircuts'),
          Tab(text: 'Makeup'),
          Tab(text: 'Massage'),
          Tab(text: 'Skin Care'),
        ],
      ),
    );
  }

  String getTabName(int index) {
    switch (index) {
      case 1:
        return 'Haircuts';
      case 2:
        return 'Makeup';
      case 3:
        return 'Massage';
      case 4:
        return 'Skin Care';
      default:
        return 'All';
    }
  }

  Widget _buildPopularArtists() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const ServicesImageSlider(
                assetName: 'assets/Images/Popular Artist/Lily.png',
                title: 'Lily',
                height: 64,
                width: 64,
              ),
              Text("Hair Stylist",
                  style: AppStyles.t5(color: AppColors.textColor)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              const ServicesImageSlider(
                assetName: 'assets/Images/Popular Artist/Lee.png',
                title: 'Lily',
                height: 64,
                width: 64,
              ),
              Text("Sx Barber",
                  style: AppStyles.t5(color: AppColors.textColor)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              const ServicesImageSlider(
                assetName: 'assets/Images/Popular Artist/Connor.png',
                title: 'Lily',
                height: 64,
                width: 64,
              ),
              Text("Makeup Artist",
                  style: AppStyles.t5(color: AppColors.textColor)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              const ServicesImageSlider(
                assetName: 'assets/Images/Popular Artist/Jason.png',
                title: 'Lily',
                height: 64,
                width: 64,
              ),
              Text("Hair Stylist",
                  style: AppStyles.t5(color: AppColors.textColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSalonListTile(String asset) {
    return ListTile(
      leading: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          asset,
          width: 96,
          height: 96,
          fit: BoxFit.fill,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Green Apple",
              style: AppStyles.t1(color: AppColors.textPrimary),
            ),
            Text('6391 Elgin St. Celina, Delaware',
                style: AppStyles.t3Small(color: AppColors.textSecondary)),
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FluentIcons.star_12_filled,
                  color: Colors.yellow[700], size: 16),
              const SizedBox(width: 2),
              Text('4.5', style: AppStyles.t3Small(color: Colors.black)),
              const SizedBox(width: 10),
              Icon(FluentIcons.location_12_filled,
                  color: Colors.grey[500], size: 16),
              const SizedBox(width: 2),
              Text('5km', style: AppStyles.t3Small(color: Colors.grey)),
              const SizedBox(width: 2),
              ElevatedButton(
                onPressed: () {
                  // Handle booking logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Book', style: AppStyles.t2(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
