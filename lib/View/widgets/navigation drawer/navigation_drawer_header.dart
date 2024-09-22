import 'package:flutter/material.dart';
import 'package:investment/constants/app_colors.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: buttonColor,
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Q U I X E L - M E N U',
          textAlign:  TextAlign.center,
          style: TextStyle(color: Colors.white,),
          ),
          // Text('Tap Here',
          // style: TextStyle(color: Colors.white),
          // )
        ],
      ),
    );
  }
}