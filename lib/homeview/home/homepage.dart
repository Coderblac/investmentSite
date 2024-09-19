import 'package:flutter/material.dart';
import 'package:investment/homeview/widgets/call_to_action/call_to_action.dart';
import 'package:investment/homeview/widgets/centeredview/centeredview.dart';
import 'package:investment/homeview/widgets/course_details/course_detail.dart';
import 'package:investment/homeview/widgets/navigationbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:  Centeredview(
        child: Column(children: <Widget>[
          CustomNavigationBar(),
          Expanded(child: Row(
            children: [
              CourseDetail(),
              Expanded(child: Center(child: CallToAction('Invest Now'),))
            ],
          ))
        ],),
      ),
    );
  }
}