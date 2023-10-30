import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesbuzz/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pesbuzz/theme/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        appBarTheme: AppBarTheme(
          toolbarHeight: 75,
          centerTitle: true,
          backgroundColor: AppColors.transparentColor,
          shadowColor: AppColors.transparentColor,
        ),
        primaryColor: AppColors.bgGradientStartColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
      ),
      home: const SplashScreen(),
    );
  }
}
