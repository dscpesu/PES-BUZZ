import 'package:flutter/material.dart';
import '/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PES Buzz',
      theme: ThemeData(
        primaryColor: Color(0xFF4169E1), // Royal Blue

        scaffoldBackgroundColor: Colors.white, // Background color
      ),
      home: HomeScreen(),
    );
  }
}
