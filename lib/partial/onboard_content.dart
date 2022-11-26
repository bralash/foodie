// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
