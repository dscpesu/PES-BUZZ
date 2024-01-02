import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pesbuzz/theme/palette.dart';
import '/models/news_item_model.dart';
import '/services/firestore_service.dart';
import '/widgets/list_view_builder_tab.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DisplayFirestoreData extends StatefulWidget {
  final String category;

  const DisplayFirestoreData({Key? key, required this.category})
      : super(key: key);

  @override
  _DisplayFirestoreDataState createState() => _DisplayFirestoreDataState();
}

class _DisplayFirestoreDataState extends State<DisplayFirestoreData> {
  final FirestoreService firestoreService = FirestoreService();

  late bool _isRefreshing;

  @override
  void initState() {
    super.initState();
    _isRefreshing = false;
  }

  Future<void> _refresh() async {
    // Implement the logic to fetch data again from Firestore here
    // For example:
    try {
      // Set _isRefreshing to true to indicate that a refresh is in progress
      setState(() {
        _isRefreshing = true;
      });

      // Fetch data from Firestore or perform other refresh logic
      await firestoreService.fetchNewsItemsByCategory(widget.category);
    } catch (error) {
      // Handle any errors that occur during the refresh
      print('Error during refresh: $error');
    } finally {
      await Future.delayed(const Duration(milliseconds: 600));
      // Set _isRefreshing to false when the refresh is complete
      setState(() {
        _isRefreshing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: _refresh,
      showChildOpacityTransition: false,
      color: AppColors.blackColor,
      child: FutureBuilder<List<NewsItemModel>>(
        future: _isRefreshing
            ? Future.value(
                []) // Show an empty list while refreshing to hide the Spinkit
            : firestoreService.fetchNewsItemsByCategory(widget.category),
        builder: (context, snapshot) {
          final key = ValueKey('content-${widget.category}');
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    key: ValueKey('loading-${widget.category}'),
                    child: SpinKitDualRing(
                      color: AppColors.blackColor,
                      size: 30.0,
                    ),
                  )
                : snapshot.hasError
                    ? Center(
                        key: ValueKey('error-${widget.category}'),
                        child: Text('An error occurred: ${snapshot.error}'),
                      )
                    : ListViewBuilderByTab(
                        key: ValueKey(
                            'content-${widget.category}'), // Unique key for the ListViewBuilderByTab
                        category: widget.category,
                        newsItems: snapshot.data ?? [],
                      ),
          );
        },
      ),
    );
  }
}
