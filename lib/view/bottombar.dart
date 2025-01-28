import 'package:flutter/material.dart';
import 'package:zack_shoping/view/cart_page.dart';
import 'package:zack_shoping/view/explore.dart';
import 'package:zack_shoping/view/favorite.dart';
import 'package:zack_shoping/view/introduction.dart';
import 'package:zack_shoping/view/profile.dart';

class MainBottombar extends StatefulWidget {
  final int initialIndex; // Default tab index
  final int accessScreensIndex; // Index for access screens

  const MainBottombar({
    super.key,
    this.initialIndex = 0, // Default tab index
    this.accessScreensIndex =
        -1, // Default index for access screens (-1 means no overlay)
  });

  @override
  _MainBottombarState createState() => _MainBottombarState();
}

class _MainBottombarState extends State<MainBottombar> {
  late int _currentIndex;
  late List<Widget> _defaultScreens;
  final GlobalKey<IntroductionScreenState> _introductionScreenKey =
      GlobalKey<IntroductionScreenState>(); // Key for IntroductionScreen

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Set the initial index for tabs

    // Define default screens
    _defaultScreens = [
      IntroductionScreen(key: _introductionScreenKey, autoPlay: _currentIndex == 0),
      ExploreScreen(),
      FavoriteScreen(),
      CartPage(),
      ProfilePage(),
    ];
  }

  void _onTabTapped(int index) {
    // Pause the video if navigating away from IntroductionScreen
    if (_currentIndex == 0 && index != 0) {
      _introductionScreenKey.currentState?.pauseVideo();
    }

    // Update the current index
    setState(() {
      _currentIndex = index;
    });

    // Play the video if navigating back to IntroductionScreen
    if (index == 0) {
      _introductionScreenKey.currentState?.playVideo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _defaultScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        backgroundColor: Colors.white,
        iconSize: 35,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
