import 'package:flutter/material.dart';
import 'package:investment/View/home/home_content_desktop.dart';
import 'package:investment/View/home/home_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
              mobile: const HomeContentMobile(),
              desktop: const HomeContentDesktop(),);
  }
}