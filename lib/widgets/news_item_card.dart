import 'package:flutter/material.dart';
import '/models/news_item_model.dart';
import '/screens/event_detail_screen.dart';

class NewsItemCard extends StatelessWidget {
  final NewsItemModel newsItem;

  NewsItemCard({required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.0),
          child: Image.network(newsItem.imageUrl),
        ),
        title: Text(newsItem.headline,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${newsItem.clubName} | ${newsItem.date}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailScreen(newsItem: newsItem),
            ),
          );
        },
      ),
    );
  }
}
