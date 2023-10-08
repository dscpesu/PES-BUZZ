import 'package:flutter/material.dart';
import '/models/news_item_model.dart';
import 'package:pesbuzz/widgets/news_item_card.dart';

class HomeScreen extends StatelessWidget {
  final List<NewsItemModel> newsItems = [
    NewsItemModel(
      id: '1',
      date: 'October 10, 2023',
      headline: 'College Fest Announcement',
      clubName: 'Event Club',
      description: 'Join us for the annual college fest!',
      imageUrl:
          'https://storage.googleapis.com/events-app-django.appspot.com/events/uploads/20230411%20095939_aatma23.jpg?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=events-app-django%40appspot.gserviceaccount.com%2F20231008%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20231008T155313Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=9bd7aa0d8f3aa3a8e6e0b40ba83c617c816690f8652021b24e85031de40013d76abb83a8a1cdc9bafb50c04712e280b9c8ebdebfe6699d67585ac890642ae18740304e8bc7f67628f828cf1a5073432550596c37dd82fc9f0eb7ade22f797f0d920fa3b784568275ef4a4bc4fb102402c8f40a9f8693e2f67d9b67efdf49d6927703e4f6213a7258baa8b519bc0eb2fa5d995d7cf4d828e99bd4db9049d6a20d2d4b3c91ee1943c163f21a917745c5257144089c89671728d7b6e276e63d384778b0ba0e47209ceba6a1b72e3a8dfb4b16f26d9f04a6541861ac1104668c8a8199501d6cd72128102a0e791da7c447226b029f5e8b32e42dc28e5a021e76da4a',
    ),

    // Add more NewsItemModel instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PES Buzz'),
        backgroundColor:
            Color(0xFF4169E1), // Use the primary color for app bar background
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final newsItem = newsItems[index];
          return NewsItemCard(newsItem: newsItem);
        },
      ),
    );
  }
}
