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
            margin: const EdgeInsets.all(20),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Colors.grey,
              ),
            ],
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            imageUrl: newsItem.imageUrl,
          ),
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey,
                ),
                child: Text(
                  newsItem.clubName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                      color: Colors.black),
                ),
              ),
              Text(
                newsItem.headline,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    color: Colors.black),
              ),
              Text(
                newsItem.date,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    color: Colors.black),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
