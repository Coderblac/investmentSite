import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget {
  final String heading;
  final String subTitleHint;
  final String imagePath;
  const ImageDetails({super.key, 
  required this.heading,
  required this.subTitleHint,
  required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 400,
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  width: 150,
                  height: 150,
                ),
                Container(
                  height: 200,
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        heading,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subTitleHint,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}