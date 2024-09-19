import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Flutter Web.\nBasis', style: TextStyle(height: 0.9,
          fontWeight: FontWeight.bold,
          fontSize: 35),
          textAlign: TextAlign.left,),
          SizedBox(height: 30,),
          Text('Discription text package:investment/homeview/widgets/course_details/course_detail.dart')
        ],
      ),
    );
  }
}