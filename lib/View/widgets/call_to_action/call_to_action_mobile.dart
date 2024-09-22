import 'package:flutter/material.dart';
import 'package:investment/constants/app_colors.dart';

class CallToActionMobile extends StatelessWidget {
  final String title;
  final String navigationPath;
  const CallToActionMobile(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: buttonColor,
      borderRadius: BorderRadius.circular(5) ),
      child: Text(
      title,
      style:const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600, 
      color: Colors.white),),
    );
  }
}