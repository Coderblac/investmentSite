import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  final String title;
  const CallToAction(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Text(title,
      style: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w600, 
      color: Colors.white),
      ),
      decoration: BoxDecoration(color: Colors.blue,
      borderRadius: BorderRadius.circular(5) ),
    );
  }
}