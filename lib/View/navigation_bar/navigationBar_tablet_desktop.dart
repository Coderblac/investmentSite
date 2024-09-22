// import 'package:flutter/material.dart';
// import 'package:investment/View/navigation_bar/navBar_item.dart';
// import 'package:investment/View/navigation_bar/navBar_logo.dart';
// import 'package:investment/routing/route_names.dart';


// class NavigationbarTabletDesktop extends StatelessWidget {
//   const NavigationbarTabletDesktop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//            const NavbarLogo(),
//          Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               // first check a user is signed in using firebase, 
//              const NavBarItem('Sign Up',SignUpRoute), //hide this if user is signed in
//              const SizedBox(width: 40,),
//               GestureDetector(
//                 onTap: () {
//                   // create the logic for logging out the current user
//                 },
//                 child: const Text('Logout')), //show this if user is signed in
//              const SizedBox(width: 40,),//show this if user is signed in
//              const NavBarItem('About', AboutRoute),
//              const SizedBox(width: 40,), //hide this if user is not signed in
//              const NavBarItem('Dashboard', InvestmentDashboardRoute), //hide this if user is not signed in
//              const SizedBox(width: 40,), //hide this if user is not signed in
//              const NavBarItem('Profile', ProfileRoute), //hide this if user is not signed in
  
//           ],
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investment/View/navigation_bar/navBar_item.dart';
import 'package:investment/View/navigation_bar/navBar_logo.dart';
import 'package:investment/routing/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationbarTabletDesktop extends StatelessWidget {
  const NavigationbarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const NavbarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    User? user = snapshot.data;

                    // If no user is signed in, show 'Sign Up' and 'About'
                    if (user == null) {
                      return const Row(
                        children:  [
                          NavBarItem('Sign Up', SignUpRoute), // Show when no user is signed in
                          SizedBox(width: 40),
                          NavBarItem('About', AboutRoute),
                        ],
                      );
                    } else {
                      // If user is signed in, show 'Logout', 'Dashboard', 'Profile', and 'About'
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                            },
                            child: const Text('Logout'),
                          ),
                          const SizedBox(width: 40),
                          const NavBarItem('About', AboutRoute), // Show in both cases
                          const SizedBox(width: 40),
                          const NavBarItem('Dashboard', InvestmentDashboardRoute), // Show when signed in
                          const SizedBox(width: 40),
                          const NavBarItem('Profile', ProfileRoute), // Show when signed in
                        ],
                      );
                    }
                  }

                  // While loading, show nothing or a spinner
                  return const SizedBox.shrink(); // Or replace with CircularProgressIndicator()
                },
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}
