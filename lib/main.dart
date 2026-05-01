import 'package:flutter/material.dart';
import 'utils/responsive_layout.dart';
import 'layouts/mobile_layout.dart';
import 'layouts/desktop_layout.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // 👇 SHOW LOGIN PAGE FIRST
      home: const LoginPage(),  

      // 👇 Routes for navigation
      routes: {
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}