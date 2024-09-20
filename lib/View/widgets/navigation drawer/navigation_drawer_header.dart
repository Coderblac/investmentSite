import 'package:flutter/material.dart';
import 'package:investment/constants/app_colors.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: buttonColor,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text('Skill',
          style: TextStyle(color: Colors.white),
          ),
          Text('Tap Here',
          style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}