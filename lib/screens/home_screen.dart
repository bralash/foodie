// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/data.dart';
import '../constants.dart';
// import '../data.dart';
import '../partial/image_carousel.dart';
import '../partial/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Delivery to".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: kActiveColor),
                ),
                Text(
                  "Whindo, Takoradi",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Filter",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Featured Partners",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.25,
                        child: Image.asset("assets/images/medium_1.png"),
                      ),
                      Text(
                        mediumCardData[0]['name'],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        mediumCardData[0]['location'],
                        style: TextStyle(
                          color: kBodyTextColor,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2,
                                vertical: defaultPadding / 8),
                            decoration: BoxDecoration(
                              color: kActiveColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            child: Text(
                              "4.6",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text("25 min"),
                          Spacer(),
                          Text("Free delivery"),
                        ],
                      ),
                    ],
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
