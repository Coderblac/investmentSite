// import 'package:flutter/material.dart';
// import 'package:investment/homeview/home/homepage.dart';
// import 'package:investment/routing/route_names.dart';

// Route<dynamic> generateRoute(RouteSettings settings){
//   switch (settings.name) {
//     case HomeRoute:
//     return _getPageRoute(HomePage());
//     case AboutRoute:
//     return _getPageRoute(AboutPage());
//     case SignUpRoute:
//     return _getPageRoute(SignUpPage());      
//     default:
//   } throw (e);

// }

// PageRoute _getPageRoute(Widget child){
//   return MaterialPageRoute(builder: (context)=>child);
// }

import 'package:flutter/material.dart';
import 'package:investment/View/about/about.dart';
import 'package:investment/View/auth/login.dart';
import 'package:investment/View/auth/signup.dart';
import 'package:investment/View/errors/not_found_page.dart';
import 'package:investment/View/home/homepage.dart';
import 'package:investment/View/investment_dashboard/dashboard_and_market.dart';
import 'package:investment/View/investment_dashboard/profile.dart';
import 'package:investment/routing/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case AboutRoute:
      return _getPageRoute(AboutPage());
    case SignUpRoute:
      return _getPageRoute(SignUpPage());
    case loginRoute:
      return _getPageRoute(LoginPage(onTap: () {},));
    case InvestmentDashboardRoute:
      return _getPageRoute(DashboardAndMarket());
    case ProfileRoute:
      return _getPageRoute(ProfilePage());
    default:
      return _getPageRoute(NotFoundPage());  // Fallback page
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder{
  final Widget child;
  _FadeRoute({required this.child}) :
  super(pageBuilder 
  : (BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    )=>child,
    transitionsBuilder: 
    ( BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child
    )=>FadeTransition(opacity: animation, child: child,)
  );
}