import 'package:flutter/material.dart';
import 'package:pesbuzz/widgets/image_container.dart';
import '/models/news_item_model.dart';
import '/screens/event_detail_screen.dart';

class NewsItemCard extends StatelessWidget {
  final NewsItemModel newsItem;

  const NewsItemCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(newsItem: newsItem),
          ),
        );
      },
      child: Row(
        children: [
          ImageContainer(
            // padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(1, 1),
                color: Colors.grey,
              ),
            ],
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            imageUrl: newsItem.imageUrl,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.headline,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.black,
                      ),
                ),
                Text(
                  newsItem.clubName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        height: 1,
                        color: const Color(0xff7B6C6C),
                      ),
                ),
                Text(
                  newsItem.date,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                        color: const Color(0xff7B6C6C),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
