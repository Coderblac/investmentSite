import 'package:flutter/material.dart';
import 'package:investment/View/widgets/call_to_action/call_to_action.dart';
import 'package:investment/View/widgets/course_details/course_detail.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
            children: [
              CourseDetail(),
              Expanded(child: Center(child: CallToAction('Invest Now'),))
            ],
          );
  }
}