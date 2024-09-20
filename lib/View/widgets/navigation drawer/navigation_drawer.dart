import 'package:flutter/material.dart';
import 'package:investment/View/widgets/navigation%20drawer/drawer_item.dart';
import 'package:investment/View/widgets/navigation%20drawer/navigation_drawer_header.dart';
import 'package:investment/routing/route_names.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration:const BoxDecoration(color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: const Column(children: [
        NavigationDrawerHeader(),
        DrawerItem(Icons.abc, 'SignUp', SignUpRoute),
        DrawerItem(Icons.help_outline, 'About',AboutRoute)
      ],),
    );
  }
}