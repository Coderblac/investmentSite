

import 'package:flutter/material.dart';
import 'package:investment/locator/locator.dart';
import 'package:investment/services/navigation_service.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          // DONT EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
          // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
          locator<NavigationService>().navigateTo(navigationPath);
        },
        child: Text(title),
    );
  }
}