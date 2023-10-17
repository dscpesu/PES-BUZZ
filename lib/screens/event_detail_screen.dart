import 'package:flutter/material.dart';
import 'package:pesbuzz/widgets/image_container.dart';
import '/models/news_item_model.dart';

class EventDetailScreen extends StatelessWidget {
  final NewsItemModel newsItem;

  const EventDetailScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Event Details'),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        // Use ListView if adding another child...
        // physics: const BouncingScrollPhysics(),
        // padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
            ),
            ImageContainer(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              imageUrl: newsItem.imageUrl,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        color: Colors.grey)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey,
                              ),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                newsItem.clubName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        height: 1.25,
                                        color: Colors.black),
                              ),
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            newsItem.date,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    height: 1.25,
                                    color: Colors.black),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 20),
                      const SizedBox(height: 10),
                      Text(
                        newsItem.headline,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                                color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsItem.description,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            height: 1.25,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ),
          ],
        ),
        // Text("This is the bottom content"),
      ),
    );
  }
}
