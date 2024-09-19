import 'package:flutter/material.dart';

class Centeredview extends StatelessWidget {
  final Widget child;
  const Centeredview({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 1200),
      child: child,),
    );
  }
}