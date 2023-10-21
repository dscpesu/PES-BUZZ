import 'package:flutter/material.dart';
import '/widgets/display_firestore_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PES Buzz',
        style:TextStyle(
          color: Colors.black,
        ),
        ),
        backgroundColor: const Color(0xffe9ffe7), 
      ),
      body: PageView(
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
          DisplayFirestoreData(category: 'Bookmarks'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
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
            icon: Icon(Icons.trending_up,
            size: 30.0,),
            label: 'Trendy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event,
            size: 30.0,),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined,
            size: 30.0,),
            label: 'Department',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline,
            size: 30.0,),
            label: 'Bookmarks',
          ),
        ],
        fixedColor: Colors.black      ),
    );
  }
}
