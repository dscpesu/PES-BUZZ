import 'package:flutter/material.dart';
import 'package:pesbuzz/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PES Buzz',
      theme: ThemeData(
        primaryColor: const Color(0xFF4169E1), // Royal Blue
        scaffoldBackgroundColor: Colors.white, // Background color
      ),
      home: const SplashScreen(),
    );
  }
}
