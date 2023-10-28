import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesbuzz/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase here

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PES Buzz',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 75,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        primaryColor: const Color(0xFF4169E1), // Royal Blue
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
