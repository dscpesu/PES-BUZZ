import 'package:flutter/material.dart';
import '/models/news_item_model.dart';
import 'package:pesbuzz/widgets/list_view_builder_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NewsItemModel> newsItems = [
    NewsItemModel(
      id: '1',
      date: 'October 15, 2023',
      headline: 'Kodikon 3.0',
      clubName: 'Embrione',
      description: 'Join us for the annual college hackathon!',
      category: 'Trendy',
      imageUrl:
          'https://yt3.googleusercontent.com/aEjE7dcPEV6WGjqSN8oY8ckgKjm5tv2TSwL0lhJVhy9_3NM3WIUfDzuie6DVLggwLEJ3etM3=s900-c-k-c0x00ffffff-no-rj',
    ),
    NewsItemModel(
      id: '2',
      date: 'October 16, 2023',
      headline: 'Hallothon',
      clubName: 'Hallothon',
      description: 'Join us for the annual college hackathon!',
      category: 'Trendy',
      imageUrl:
          'https://yt3.googleusercontent.com/aEjE7dcPEV6WGjqSN8oY8ckgKjm5tv2TSwL0lhJVhy9_3NM3WIUfDzuie6DVLggwLEJ3etM3=s900-c-k-c0x00ffffff-no-rj',
    ),
    NewsItemModel(
      id: '3',
      date: 'October 20, 2023',
      headline: 'Cricket Tournament Finals',
      clubName: 'Sports Club',
      description: 'Join us for the annual sports hackathon!',
      category: 'Sports',
      imageUrl:
          'https://yt3.googleusercontent.com/aEjE7dcPEV6WGjqSN8oY8ckgKjm5tv2TSwL0lhJVhy9_3NM3WIUfDzuie6DVLggwLEJ3etM3=s900-c-k-c0x00ffffff-no-rj',
    ),
    NewsItemModel(
      id: '4',
      date: 'October 25, 2023',
      headline: 'ISA 1 review',
      clubName: 'CSE',
      description: 'Join us for the annual college ISA review',
      category: 'Department',
      imageUrl:
          'https://yt3.googleusercontent.com/aEjE7dcPEV6WGjqSN8oY8ckgKjm5tv2TSwL0lhJVhy9_3NM3WIUfDzuie6DVLggwLEJ3etM3=s900-c-k-c0x00ffffff-no-rj',
    ),
    NewsItemModel(
      id: '5',
      date: 'October 26, 2023',
      headline: 'ISA 1 review',
      clubName: 'ECE',
      description: 'Join us for the annual college ISA review',
      category: 'Department',
      imageUrl:
          'https://yt3.googleusercontent.com/aEjE7dcPEV6WGjqSN8oY8ckgKjm5tv2TSwL0lhJVhy9_3NM3WIUfDzuie6DVLggwLEJ3etM3=s900-c-k-c0x00ffffff-no-rj',
    ),
  ];

  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PES Buzz'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4169E1),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: <Widget>[
          ListViewBuilderByTab(category: 'Trendy', newsItems: newsItems),
          ListViewBuilderByTab(category: 'Sports', newsItems: newsItems),
          ListViewBuilderByTab(category: 'Department', newsItems: newsItems),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.sports_soccer),
            label: 'Sports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Department',
          ),
        ],
      ),
    );
  }
}
