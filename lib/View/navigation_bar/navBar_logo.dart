import 'package:flutter/material.dart';

class NavbarLogo extends StatelessWidget {
  const NavbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 35, width: 35,
          child: 
          Image.asset('assets/logo.png',),
          );
  }
}