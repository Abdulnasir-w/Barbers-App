import 'package:barbar/Constants/colors.dart';
import 'package:barbar/Screens/Chat/chat.dart';
import 'package:barbar/Screens/Main/Home%20Screen/home_screen.dart';
import 'package:barbar/Screens/More/profile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../Screens/Main/Location Screen/location_screen.dart';
import '../Screens/Main/book_appointment.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LocationScreen(),
    const Appointments(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(FluentIcons.home_24_regular),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(FluentIcons.location_24_regular),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(FluentIcons.calculator_24_regular),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(FluentIcons.chat_24_regular),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(FluentIcons.person_24_regular),
      label: "",
    ),
  ];

  void _onPageChanged(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
