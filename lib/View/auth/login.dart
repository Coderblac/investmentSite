import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment/View/auth/auth.dart';
import 'package:investment/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  _LoginPageState createState() => _LoginPageState();
}
  OutlineInputBorder _buildInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), // Circular border radius of 20
      borderSide: const BorderSide(color: Colors.grey), // Border color
    );
  }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation){
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: sizingInformation.deviceScreenType == DeviceScreenType.desktop?
          size.width * 0.35
          : sizingInformation.deviceScreenType == DeviceScreenType.tablet
          ? size.width *0.45
          : size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: sizingInformation.deviceScreenType != DeviceScreenType.mobile
              ? buttonColor.withOpacity(0.1)
              : Colors.transparent
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    const Text('Q U I X E L',
                    style:TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                  border: _buildInputBorder(),
                  enabledBorder: _buildInputBorder(), // Border when enabled
                  focusedBorder: _buildInputBorder(), // Border when focused
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  
                  labelText: 'password',
                  border: _buildInputBorder(),
                  enabledBorder: _buildInputBorder(),
                  focusedBorder: _buildInputBorder(),
                ),
                obscureText: true,
              ),
                     const SizedBox(height: 10,),
                   GestureDetector (child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Forgot password?', style: TextStyle(color: Colors.blue),),
                    ],
                  )),
                     const SizedBox(height: 10,),
                     GestureDetector(
                      onTap: _login,
                       child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: buttonColor),
                        width: double.infinity, 
                        child: const Center(child: Text('Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15, 
                              fontWeight: FontWeight.normal),                      
                        )),),
                     ),
                    
        
                  const  SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const  Text("Don't have an account? "),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15, 
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
           ],),
        )
        ),
      );
     }
    );
  }
void _login() async {
  // Show progress indicator
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  String emailOrUsername = _emailController.text.trim();
  String password = _passwordController.text.trim();

  try {
    // Determine if input is an email
    final isEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(emailOrUsername);

    if (isEmail) {
      // Sign in with email
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailOrUsername,
        password: password,
      );
    } else {
      // Look up the email associated with the username
      final userQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: emailOrUsername)
          .limit(1)
          .get();

      if (userQuery.docs.isEmpty) {
        throw FirebaseAuthException(code: 'user-not-found', message: 'User not found.');
      }

      // Get the email from the user document
      final userDoc = userQuery.docs.first;
      final userEmail = userDoc['email'];

      // Sign in with the found email
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: password,
      );
    }

    // Pop progress indicator
    if (context.mounted) Navigator.pop(context);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Is Successful', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to the MainPage or any other page upon successful login
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);

    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login Failed: ${e.message}', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
  } catch (e) {
   

    // Show general error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An unexpected error occurred: $e', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
     Navigator.pop(context);
  }
}

}
