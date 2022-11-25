// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
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

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff010824) : Color(0xff010824).withOpacity(0.4),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
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

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Spacer(),
        Image.asset(
          image,
          width: 320,
        ),
        Spacer(),
        Text(
          title,
          style: GoogleFonts.quicksand(
            color: Color(0xff010824),
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          description,
          style: GoogleFonts.quicksand(
            color: Color(0xff898989),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    );
  }
}
