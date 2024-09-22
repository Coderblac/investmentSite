// import 'package:flutter/material.dart';
// import 'package:investment/View/navigation_bar/navBar_logo.dart';

// class NavigationBarMobile extends StatelessWidget {
//   const NavigationBarMobile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
//           NavbarLogo(),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:investment/View/navigation_bar/navBar_logo.dart';
import 'package:investment/View/widgets/navigation%20drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({super.key});

  // Function to show dialog at top-left
void showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ResponsiveBuilder(
        builder: (context, sizingInformation) {
          // Automatically close the dialog if the device type is not mobile
          if (sizingInformation.deviceScreenType != DeviceScreenType.mobile) {
            Navigator.of(context).pop();
            return const SizedBox.shrink(); // Return an empty widget as the dialog will be closed
          }

          return Stack(
            children: [
              // Positioned dialog at the top-left of the screen
              Positioned(
                top: 0,
                left: 0,
                child: Material(
                  color: Colors.transparent, // Set transparent background for custom positioning
                  child: Container(
                    color: Colors.yellow, // Background color for dialog
                    width: MediaQuery.of(context).size.width * 0.45, // Set dialog width
                    height: MediaQuery.of(context).size.height * 0.47, // Set dialog height
                    child: Stack(
                      children: [
                        // Your custom content (e.g., CustomNavigationDrawer)
                         const Positioned.fill(
                          child: CustomNavigationDrawer(), // Your custom content
                        ),
                        
                        // Positioned close button in the top-right of the dialog
                        Positioned(
                          top: 10,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.cancel),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          showPopup(context);
                        },
                        icon: const Icon(Icons.menu),
                      );
                    },
                  ),
                  const NavbarLogo(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
