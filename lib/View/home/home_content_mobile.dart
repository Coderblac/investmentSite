// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:investment/View/widgets/call_to_action/call_to_action.dart';
// import 'package:investment/View/widgets/course_details/course_detail.dart';
// import 'package:investment/routing/route_names.dart';

// class HomeContentMobile extends StatelessWidget {
//   const HomeContentMobile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//          const CourseDetail(),
//          const SizedBox(
//             height: 20,
//           ),
//           Image.asset('assets/office.jpg'),
//          const SizedBox(
//             height: 20,
//           ),
//                            StreamBuilder<User?>(
//                     stream: FirebaseAuth.instance.authStateChanges(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.active) {
//                         User? user = snapshot.data;
                  
//                         // If no user is signed in, show 'Sign Up' and 'About'
//                         if (user == null) {
//                           return const Column(
//                             children:  [
//                               CallToAction(
//                                 'Continue',SignUpRoute,),// Show when no user is signed in
//                             ],
//                           );
//                         } else { 
//                           const CallToAction('Invest Now', InvestmentDashboardRoute);}}}),
                          
//                              Container(
//                                margin: const EdgeInsets.symmetric(vertical: 20),
//                                padding: const EdgeInsets.symmetric(vertical: 20),
//                                width: 400,
//                                height: 200,
//                                child: Row(
//                                  mainAxisSize: MainAxisSize.min,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  children: [
//                                Image.asset('assets/4.png',width: 150,height: 150,),
//                                Container(
//                                  height: 200,
//                                  width: 250,
//                                   child: 
//                                 const Column(
//                                  mainAxisSize: MainAxisSize.min,
//                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                    crossAxisAlignment: CrossAxisAlignment.end,
//                                    children: [
//                                         Text('INVESTMENT\nMANAGEMENT',
//                                         textAlign: TextAlign.right,
//                                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                                          Text('The fandling of\nfinancial assets and\nother investments by\nprofessionals for clients',
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                              
//                                ],
//                                ),
//                              )
//                     ],
//                   ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment/View/widgets/call_to_action/call_to_action.dart';
import 'package:investment/View/widgets/course_details/course_detail.dart';
import 'package:investment/routing/route_names.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const CourseDetail(),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/office.jpg'),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<User?>(
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 400,
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/4.png',
                  width: 150,
                  height: 150,
                ),
                Container(
                  height: 200,
                  width: 250,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'INVESTMENT\nMANAGEMENT',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The handling of\nfinancial assets and\nother investments by\nprofessionals for clients',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
