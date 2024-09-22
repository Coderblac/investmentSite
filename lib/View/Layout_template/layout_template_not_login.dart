import 'package:flutter/material.dart';
import 'package:investment/View/navigation_bar/navigationbar.dart';
import 'package:investment/View/widgets/centeredview/centeredview.dart';
import 'package:investment/View/widgets/navigation%20drawer/navigation_drawer.dart';
import 'package:investment/locator/locator.dart';
import 'package:investment/routing/route_names.dart';
import 'package:investment/routing/router.dart';
import 'package:investment/services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

// class LayoutTemplateNotLogin extends StatelessWidget {
//   const LayoutTemplateNotLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(
//       builder:(context, sizingInformation)=>
//         Scaffold(
//           drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
//           ? const CustomNavigationDrawer()
//           :null,
//         backgroundColor: Colors.white,
//         body:  Centeredview(
//           child: Column(children: <Widget>[
//             const CustomNavigationBar(),
//             Image.asset('assets/office.jpg'),
//             Expanded(child: Navigator(
//               key: locator<NavigationService>().navigatorKey,
//               onGenerateRoute: generateRoute,
//               initialRoute: HomeRoute,
//             )
//             ),
            
//           ],),
//         ),
//       ),
//     );
//   }
// }
class LayoutTemplateNotLogin extends StatelessWidget {
  const LayoutTemplateNotLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const CustomNavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: Centeredview(
          child: Column(
            children: <Widget>[
              const CustomNavigationBar(),
              // Make everything below the CustomNavigationBar scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height, // Set an appropriate height
                        child: Navigator(
                          key: locator<NavigationService>().navigatorKey,
                          onGenerateRoute: generateRoute,
                          initialRoute: HomeRoute,
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
