import 'package:flutter/material.dart';

class AboutDetails extends StatelessWidget {
  final String heading;
  final String subTitle;
  const AboutDetails({super.key, required this.heading, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Text(heading,
        style: const TextStyle(fontWeight:  FontWeight.bold),),
        Text(subTitle,
        style: const TextStyle(fontWeight:  FontWeight.normal),
        softWrap: true,),
        const SizedBox(height: 20,),
      ],
    );
  }
}