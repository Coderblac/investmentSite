import 'package:flutter/material.dart';
import 'package:investment/View/auth/login.dart';
import 'package:investment/View/auth/signup.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  // intially, show login page
  bool showLoginPage = true;

  //  toggle between login and  register page
  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage)
    {return LoginPage(onTap: togglePages);}
    else{
    return SignUpPage(onTap: togglePages);
  }
  }
}