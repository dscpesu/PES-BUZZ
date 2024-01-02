import 'package:flutter/material.dart';
import 'news_item_card.dart';
import '/models/news_item_model.dart';

class ListViewBuilderByTab extends StatelessWidget {
  final String category;
  final List<NewsItemModel> newsItems;

  const ListViewBuilderByTab(
      {Key? key, required this.category, required this.newsItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key, // Add a key to the ListViewBuilderByTab
      physics: const BouncingScrollPhysics(),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final newsItem = newsItems[index];
        if (newsItem.category == category) {
          return NewsItemCard(newsItem: newsItem);
        } else {
          return const SizedBox(
            height: 0,
          );
        }
      },
    );
  }
}
