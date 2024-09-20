import 'package:flutter/material.dart';
import 'package:investment/View/navigation_bar/navBar_item.dart';
import 'package:investment/View/navigation_bar/navBar_logo.dart';
import 'package:investment/routing/route_names.dart';

class NavigationbarTabletDesktop extends StatelessWidget {
  const NavigationbarTabletDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           NavbarLogo(),
         Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Sign Up',SignUpRoute),
              SizedBox(width: 40,),
              NavBarItem('About', AboutRoute),
              SizedBox(width: 40,),
              NavBarItem('Dashboard', InvestmentDashboardRoute),
              SizedBox(width: 40,),
              NavBarItem('Profile', ProfileRoute),
  
          ],
          )
        ],
      ),
    );
  }
}