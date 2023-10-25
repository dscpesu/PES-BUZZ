import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/widgets/display_firestore_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PES Buzz',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffe9ffe7),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffE2F9EE),
              Color(0xffFBFBD4),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
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
                children: <Widget>[
                  DisplayFirestoreData(category: 'Trendy'),
                  DisplayFirestoreData(category: 'Sports'),
                  DisplayFirestoreData(category: 'Department'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trendy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Department',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}
