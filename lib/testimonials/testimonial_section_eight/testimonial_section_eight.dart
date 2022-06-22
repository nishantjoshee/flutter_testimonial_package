import 'package:flutter/material.dart';

class TestimonialSectionEight extends StatelessWidget {
  const TestimonialSectionEight(
      {Key? key, required this.subtitle, required this.title})
      : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: Column(
        children: [
          Text(title),
          Text(subtitle),
        ],
      ),
    );
  }
}
