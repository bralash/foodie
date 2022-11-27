// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import './screens/home_screen.dart';
import 'partial/dot_indicator.dart';
import 'partial/onboard_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_pageIndex != onBoardData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: onBoardData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnboardContent(
                      title: onBoardData[index].title,
                      image: onBoardData[index].image,
                      description: onBoardData[index].description),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    onBoardData.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        nextPage();
                      },
                      style: ElevatedButton.styleFrom(shape: CircleBorder()),
                      child: Icon(Icons.arrow_right_alt),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onBoardData = [
  Onboard(
      image: "assets/order.png",
      title: "Order your food",
      description: "Now you can order food anytime from your mobile!"),
  Onboard(
      image: "assets/safe-cooking.jpg",
      title: "Cooking safe food",
      description:
          "We cook in the safest space, so you can trust the quality of your meal!"),
  Onboard(
      image: "assets/delivery.png",
      title: "Quick delivery",
      description: "Get your favorite meal delivered right to your door step!"),
];
