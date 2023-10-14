import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/news_item_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<NewsItemModel>> fetchNewsItemsByCategory(String category) async {
    final snapshot = await _firestore
        .collection('news-items')
        .where('category', isEqualTo: category)
        .get();

    final newsItems = snapshot.docs.map((doc) {
      return NewsItemModel(
        id: doc.id,
        date: doc['date'],
        headline: doc['headline'],
        clubName: doc['clubName'],
        description: doc['description'],
        category: doc['category'],
        imageUrl: doc['imageUrl'],
      );
    }).toList();

    return newsItems;
  }
}
