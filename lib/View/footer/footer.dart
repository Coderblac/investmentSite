import 'package:flutter/material.dart';
import 'package:investment/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveBuilder(
      builder: (context, sizingInformation){
        return Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(height: 105,),
              SizedBox(
                child: sizingInformation.deviceScreenType != DeviceScreenType.desktop
                ? Container(color: buttonColor,
           width: double.infinity,
          //  height: 160,
           padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Copyright 2024 Quixel inc. All right reserved',
               style: TextStyle(color: Colors.white.withOpacity(0.8)),),
               Text('United States',
               style: TextStyle(color: Colors.white.withOpacity(0.8)),),
               const SizedBox(height: 10,),
                SizedBox(
                  height: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text('Privacy Policy',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                  VerticalDivider(color: Colors.white.withOpacity(0.8), thickness: 1,),
                  Text('Terms of Use',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                  VerticalDivider(color: Colors.white.withOpacity(0.8) , thickness: 1,),
                  Text('Legal',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                               ],
                               ),
                ),
               const SizedBox(height: 15,),
               Text('Power By Q96 Inc. 5.351.2.8',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),),
             ],
           ),
           )
           : Container(color: buttonColor,
           width: double.infinity,
          //  height: 150,
           padding: const EdgeInsets.all(30),
           child: Expanded(
            flex: 1,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Copyright 2024 Quixel inc. All right reserved',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                  Text('United States',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),)
                 ],
                 ),
                 const SizedBox(height: 10,),
                  SizedBox(
                    height: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text('Privacy Policy',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                    VerticalDivider(color: Colors.white.withOpacity(0.8), thickness: 1,),
                    Text('Terms of Use',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                    VerticalDivider(color: Colors.white.withOpacity(0.8) , thickness: 1,),
                    Text('Legal',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                                 ],
                                 ),
                  ),
                 const SizedBox(height: 15,),
                 Text('Power By Q96 Inc. 5.351.2.8',
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),),
               ],
             ),
           ),
           ),
           ),
            ],
          ),
        );
    }
   );
  }
}