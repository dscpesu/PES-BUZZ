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
      child: ImageContainer(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(50),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(1, 1),
            color: Colors.grey,
          ),
        ],
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        imageUrl: newsItem.imageUrl,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.75,
              // ),
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
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    color: Colors.black),
              ),
              Text(
                newsItem.date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    color: Colors.black),
              ),
            ]),
      ),
    );
    // return Card(
    //   color: Colors.white,
    //   child: ListTile(
    //     leading: Container(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Image.network(newsItem.imageUrl),
    //     ),
    //     title: Text(newsItem.headline,
    //         style: const TextStyle(fontWeight: FontWeight.bold)),
    //     subtitle: Text('${newsItem.clubName} | ${newsItem.date}'),
    //     onTap: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => EventDetailScreen(newsItem: newsItem),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
