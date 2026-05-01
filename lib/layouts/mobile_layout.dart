import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
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