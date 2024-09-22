import 'package:flutter/material.dart';
import 'package:investment/View/navigation_bar/navBar_item.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const DrawerItem(this.icon, this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(left: 30, top: 30),
      child: Row(
        children: [
          Icon(icon),
         const SizedBox(width: 5,),
          NavBarItem(title, navigationPath)
        ],
      ),
    );
  }
}