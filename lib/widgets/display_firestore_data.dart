import 'package:flutter/material.dart';
import '/models/news_item_model.dart';
import '/services/firestore_service.dart';
import '/widgets/list_view_builder_tab.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DisplayFirestoreData extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();
  final String category;

  DisplayFirestoreData({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItemModel>>(
      future: firestoreService.fetchNewsItemsByCategory(category),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 650),
          child: snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  // key: UniqueKey(), // Do not use rn, it will cause the widget to rebuild and will trigger a dirty rebuild- Shubh
                  child: SpinKitDualRing(
                    color: Color(0xFF4169E1),
                    size: 30.0,
                  ),
                )
              : snapshot.hasError
                  ? Center(
                      //   key: UniqueKey(), // Use UniqueKey for the error widget
                      child: Text('An error occurred: ${snapshot.error}'),
                    )
                  : ListViewBuilderByTab(
                      category: category,
                      newsItems: snapshot.data ?? [],
                    ),
        );
      },
    );
  }
}
