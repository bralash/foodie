// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:foodie/partial/onboard_content.dart';
// import './onboarding_screen.dart';
import './onboarding_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingScreen()
    );
  }
}

