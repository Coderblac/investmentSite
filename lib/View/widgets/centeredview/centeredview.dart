import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Centeredview extends StatelessWidget {
  final Widget child;
  const Centeredview({required this.child});

  @override
  Widget build(BuildContext context) {
    return 
    ResponsiveBuilder(
      builder: (context, sizingInformation){
        return Scaffold(
          body: Container(
          alignment: Alignment.topCenter,
          padding: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? const 
          EdgeInsets.symmetric(horizontal: 20, vertical: 20):const 
          EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: ConstrainedBox(constraints: const BoxConstraints(maxHeight: 1200),
          child: child,),
                ),
        );
      }
    );
  }
}