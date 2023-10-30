import 'package:flutter/material.dart';
import 'package:pesbuzz/theme/palette.dart';
import '/models/news_item_model.dart';
import '/services/firestore_service.dart';
import '/widgets/list_view_builder_tab.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DisplayFirestoreData extends StatefulWidget {
  final String category;

  const DisplayFirestoreData({super.key, required this.category});

  @override
  State<DisplayFirestoreData> createState() => _DisplayFirestoreDataState();
}

class _DisplayFirestoreDataState extends State<DisplayFirestoreData> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItemModel>>(
      future: firestoreService.fetchNewsItemsByCategory(widget.category),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  key: UniqueKey(), //
                  child: SpinKitDualRing(
                    color: AppColors.blackColor,
                    size: 30.0,
                  ),
                )
              : snapshot.hasError
                  ? Center(
                      key: UniqueKey(), // Use UniqueKey for the error widget
                      child: Text('An error occurred: ${snapshot.error}'),
                    )
                  : ListViewBuilderByTab(
                      category: widget.category,
                      newsItems: snapshot.data ?? [],
                    ),
        );
      },
    );
  }
}
