import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder:(context, sizingInformation){
        var textAlignment =sizingInformation.deviceScreenType == DeviceScreenType.desktop
        ? TextAlign.left
        :TextAlign.center;
      double titleSize = sizingInformation.deviceScreenType == DeviceScreenType.mobile
        ? 35
        : 55;
      double descriptionSize = sizingInformation.deviceScreenType == DeviceScreenType.mobile
        ? 14
        : 16;
        return Container(
        width: 600,
        child: 
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(sizingInformation.deviceScreenType == DeviceScreenType.desktop)
            Text('Welcome to Quixel',
            style: TextStyle(height: 0.9,
            fontWeight: FontWeight.bold,
            fontSize: titleSize),
            textAlign: textAlignment,),
            //if(sizingInformation.deviceScreenType == DeviceScreenType.mobile)
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
               sizingInformation.deviceScreenType == DeviceScreenType.tablet) 

            Center(
              child: Text('Welcome to Quixel',
              style: TextStyle(height: 0.9,
              fontWeight: FontWeight.bold,
              fontSize: titleSize),
              textAlign: textAlignment,),
            ),
            const SizedBox(height: 30,),
            Text('Welcome to Quixel, an innovative investment platform designed to help you grow your wealth with ease and confidence. Quixel offers a user-friendly interface, comprehensive tools, and expert insights to empower both novice and experienced investors. Whether you\'re interested in stocks, bonds, or other assets, Quixel provides personalized investment strategies, real-time market analysis, and a secure environment to manage your portfolio. Join us at Quixel and take control of your financial future with smart, data-driven decisions.',
            style: TextStyle(height: 0.9,
            fontWeight: FontWeight.normal,
            fontSize: descriptionSize),
            textAlign: textAlignment,),
          ],
        ),
      );}
    );
  }
}