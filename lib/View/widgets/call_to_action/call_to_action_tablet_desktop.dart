import 'package:flutter/material.dart';
import 'package:investment/constants/app_colors.dart';

class CallToActionTabletDesktop extends StatelessWidget {
  final String title;
  final String navigationPath;
  const CallToActionTabletDesktop(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      decoration: BoxDecoration(color: buttonColor,
      borderRadius: BorderRadius.circular(5) ),
      child: Text(title,
      style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600, 
      color: Colors.white),
      ),
    );
  }
}