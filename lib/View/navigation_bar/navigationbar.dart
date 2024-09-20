import 'package:flutter/material.dart';
import 'package:investment/View/navigation_bar/navigationBar_tablet_desktop.dart';
import 'package:investment/View/navigation_bar/navigationvar_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: NavigationBarMobile(),
    tablet: NavigationbarTabletDesktop(),);
  }
}
