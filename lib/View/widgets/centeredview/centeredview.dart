import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Centeredview extends StatelessWidget {
  final Widget child;
  const Centeredview({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return 
    ResponsiveBuilder(
      builder: (context, sizingInformation){
        return Scaffold(
          body: Container(
          alignment: Alignment.topCenter,
          padding: sizingInformation.deviceScreenType == DeviceScreenType.mobile ? const 
          EdgeInsets.only(left: 20, right: 20, top: 20):const 
          EdgeInsets.only(left: 60, right: 60, top: 60),
          child: ConstrainedBox(constraints: const BoxConstraints(maxHeight: 1200),
          child: child,),
                ),
        );
      }
    );
  }
}