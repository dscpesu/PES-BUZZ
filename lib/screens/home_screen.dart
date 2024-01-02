import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pesbuzz/theme/palette.dart';
import '/widgets/display_firestore_data.dart';
import '/widgets/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  //Callback to handle when bottom bar is tapped - the below function is passed as a parameter to bottom_bar.dart
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 20),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgGradientStartColor,
        leadingWidth: 100,
        leading: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Image(
              image: AssetImage(
            'assets/logos/PesBuzzLogo.png',
          )),
        ),
        title: Text(
          'PES Buzz',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: AppColors.blackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: AppColors.blackColor,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.scaffoldBgGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                '${DateTime.now().day.toString().padLeft(2, '0')}th ${_getMonth(DateTime.now().month)}, ${DateTime.now().year}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: const <Widget>[
                  DisplayFirestoreData(category: 'Trendy'),
                  DisplayFirestoreData(category: 'Sports'),
                  DisplayFirestoreData(category: 'Department'),
                ],
              ),
            ),
          ],
        ),
      ),
      //BottomBar is now under bottom_bar.dart in widgets folder
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Unknown';
    }
  }
}
