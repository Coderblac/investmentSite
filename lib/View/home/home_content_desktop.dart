import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment/View/widgets/call_to_action/call_to_action.dart';
import 'package:investment/View/widgets/course_details/course_detail.dart';
import 'package:investment/constants/app_colors.dart';
import 'package:investment/routing/route_names.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CourseDetail(),
                            const SizedBox(height: 30,),
                            Image.asset('assets/office2.jpg')
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: 
                        Center(
                          child: StreamBuilder<User?>(
                         stream: FirebaseAuth.instance.authStateChanges(),
                         builder: (context, snapshot) {
                     if (snapshot.connectionState == ConnectionState.active) {
                       User? user = snapshot.data;
            
                             // If no user is signed in, show 'Sign Up' and 'About'
                             if (user == null) {
                               return const Column(
                                 children: [
                                   CallToAction(
                                'Continue',
                                SignUpRoute,
                                        ), // Show when no user is signed in
                                      ],
                                    );
                                  } else {
                                    // If user is signed in, show 'Invest Now'
                                    return const CallToAction(
                                      'Invest Now',
                                      InvestmentDashboardRoute,
                                    );
                                  }
                                } else {
                                  // Return an empty container or a loading widget while waiting for auth state
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                              ),
                    // Center(child: CallToAction('Invest Now',navigationPath),))
          ),
          ],
         ),
         const SizedBox(height: 105,),
         Container(color: buttonColor,
         width: double.infinity,
         height: 150,
         padding: EdgeInsets.all(30),
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
                height: 15,
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
        ],
      ),
    );
  }
}