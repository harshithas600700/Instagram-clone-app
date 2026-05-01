import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_app/pages/home_page.dart';
import 'package:insta_app/pages/profile_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Placeholder(), // Search page (replace later)
    Placeholder(), // Add post (replace later)
    Placeholder(), // Reels page (replace later)
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: 28,
              width: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 28,
              width: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/add.svg',
              height: 28,
              width: 28,
            ),
            label: '',
          ),
          
          
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/reel.svg',
              height: 28,
              width: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage('assets/images/dp.jpg'),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}