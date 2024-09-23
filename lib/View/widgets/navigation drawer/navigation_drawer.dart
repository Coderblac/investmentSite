import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment/View/widgets/navigation%20drawer/drawer_item.dart';
import 'package:investment/View/widgets/navigation%20drawer/navigation_drawer_header.dart';
import 'package:investment/routing/route_names.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.45,
      decoration:const BoxDecoration(color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        const NavigationDrawerHeader(),
                  StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        User? user = snapshot.data;
                  
                        // If no user is signed in, show 'Sign Up' and 'About'
                        if (user == null) {
                          return const Column(
                            children:  [
                              DrawerItem(
                                Icons.app_registration_rounded,
                                'Sign Up', SignUpRoute),// Show when no user is signed in
                              DrawerItem(
                                Icons.login,
                                'Login', loginRoute),
                              DrawerItem(Icons.help_outline, 'About',AboutRoute), 
                            ],
                          );
                        } else {
                          // If user is signed in, show 'Logout', 'Dashboard', 'Profile', and 'About'
                          return Column(
                            children: [
                              const DrawerItem(
                                Icons.person,
                                'Profile',ProfileRoute),  // Show when signed in
                              const DrawerItem(Icons.dashboard,'My DashBoard', InvestmentDashboardRoute), // Show when signed in
                              const SizedBox(height: 30),
                              GestureDetector(
                                       onTap: () async {
                                        await FirebaseAuth.instance.signOut();
                                      },
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 30,),
                                  child: Row(
                                    children: [
                                      Icon(Icons.login_outlined),
                                      SizedBox(width: 5,),
                                       Text('Logout'),
                                      ],
                                     ),
                                ),
                              ),
                              const DrawerItem(Icons.help_outline, 'About',AboutRoute),  // Show in both cases
                            ],
                          );
                  
                        }
                      }
                  
                      // While loading, show nothing or a spinner
                      return const SizedBox.shrink(); // Or replace with CircularProgressIndicator()
                    },
                  ),
        
      ],),
    );
  }
}