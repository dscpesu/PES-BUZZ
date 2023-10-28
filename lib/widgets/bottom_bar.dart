import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomBar(
      {Key? key, required this.currentIndex, required this.onTabTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // Ensure the labels are always displayed
      backgroundColor: Color.fromARGB(255, 34, 30, 30),
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.trending_up),
          ),
          label: 'Trendy',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.calendar_month_outlined),
          ),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.school),
          ),
          label: 'Department',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.bookmark_outline),
          ),
          label: 'Bookmarks',
        ),
      ],
    );
  }
}



// Color.fromARGB(255, 34, 30, 30),