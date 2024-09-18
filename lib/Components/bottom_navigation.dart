import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

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
    const Center(child: Text('Home Page')),
    const Center(child: Text('Location Page')),
    const Center(child: Text('Calendar Page')),
    const Center(child: Text('Chat Page')),
    const Center(child: Text('Profile Page')),
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
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
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
