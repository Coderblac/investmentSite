// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:investment/constants/app_colors.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// class SignUpPage extends StatefulWidget {
//   final void Function()? onTap;
//   const SignUpPage({super.key, this.onTap});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;

//   final _fullNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   // void _registerUser() async {
//   //   final fullName = _fullNameController.text.trim();
//   //   final email = _emailController.text.trim();
//   //   final password = _passwordController.text.trim();
//   //   final confirmPassword = _confirmPasswordController.text.trim();
//   //   final portfolioBalance = double;

//   //   if (password != confirmPassword) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text("Passwords do not match!")),
//   //     );
//   //     return;
//   //   }

//   //   try {
//   //     // Create the user in Firebase Authentication
//   //     final userCredential = await _auth.createUserWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );

//   //     // Store the user data in Firestore
//   //     await _firestore.collection('users').doc(userCredential.user?.uid).set({
//   //       'fullName': fullName,
//   //       'portfolioBalance': portfolioBalance, // Boolean field
//   //       'email': email,
//   //       // Storing password in plain text is not recommended
//   //       // 'password': password, // Avoid storing the password
//   //     });

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text("Registration Successful!")),
//   //     );

//   //     // Navigate to MainPage after successful registration
//   //     Navigator.pushReplacementNamed(context, '/mainPage');
//   //   } on FirebaseAuthException catch (e) {
//   //     // Display specific error message
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text(e.message ?? 'An error occurred')),
//   //     );
//   //   }
//   // }
//   void _registerUser() async {
//   final fullName = _fullNameController.text.trim();
//   final email = _emailController.text.trim();
//   final password = _passwordController.text.trim();
//   final confirmPassword = _confirmPasswordController.text.trim();
//   final portfolioBalance = 0.0; // Set default portfolio balance

//   if (password != confirmPassword) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Passwords do not match!")),
//     );
//     return;
//   }

//   try {
//     // Create the user in Firebase Authentication
//     final userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     // Store the user data in Firestore
//     await _firestore.collection('users').doc(userCredential.user?.uid).set({
//       'fullName': fullName,
//       'portfolioBalance': portfolioBalance, // Double field
//       'email': email,
//       // Storing password in plain text is not recommended
//       // 'password': password, // Avoid storing the password
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Registration Successful!")),
//     );

//     // Navigate to MainPage after successful registration
//     Navigator.pushReplacementNamed(context, '/mainPage');
//   } on FirebaseAuthException catch (e) {
//     // Display specific error message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(e.message ?? 'An error occurred')),
//     );
//   }
// }


//   OutlineInputBorder _buildInputBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20), // Circular border radius of 20
//       borderSide: const BorderSide(color: Colors.grey), // Border color
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return ResponsiveBuilder(
//       builder: (context, sizingInformation){
//         return Center(child:
//         sizingInformation.deviceScreenType == DeviceScreenType.desktop
//         ? SizedBox(
//           width: size.width *0.35,
//           child: _buildLayout(context),)
//         : sizingInformation.deviceScreenType == DeviceScreenType.tablet
        
//         ? SizedBox(
//           width: size.width *0.45,
//           child: _buildLayout(context))
        
//         : _buildLayout(context) ,);
//       }
//     );
//   }
//   Widget _buildLayout(context){
//     return  ResponsiveBuilder(
//       builder: (context, sizingInformation){
//       return Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: sizingInformation.deviceScreenType != DeviceScreenType.mobile
//             ? buttonColor.withOpacity(0.1)
//             : Colors.transparent
//           ),
//         child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: _fullNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Full Name',
//                     border: _buildInputBorder(),
//                     enabledBorder: _buildInputBorder(), // Border when enabled
//                     focusedBorder: _buildInputBorder(), // Border when focused
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: _buildInputBorder(),
//                     enabledBorder: _buildInputBorder(),
//                     focusedBorder: _buildInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: _buildInputBorder(),
//                     enabledBorder: _buildInputBorder(),
//                     focusedBorder: _buildInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: _confirmPasswordController,
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: _buildInputBorder(),
//                     enabledBorder: _buildInputBorder(),
//                     focusedBorder: _buildInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _registerUser,
//                   child: const Text("Register"),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Have an account? "),
//                     GestureDetector(
//                       onTap: widget.onTap,
//                       child: const Text(
//                         'Login Now',
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//       );
//       }
//     );
    
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investment/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false; // Add a loading state

  void _registerUser() async {
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    final portfolioBalance = 0.0; // Default portfolio balance

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Show CircularProgressIndicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(), // Loading indicator
      ),
    );

    try {
      // Create the user in Firebase Authentication
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store the user data in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'fullName': fullName,
        'portfolioBalance': portfolioBalance,
        'email': email,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful!")),
      );

      // Navigate to MainPage after successful registration
      Navigator.pushReplacementNamed(context, '/mainPage');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'An error occurred')),
      );
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });

      // Dismiss the CircularProgressIndicator
      Navigator.of(context).pop();
    }
  }
    OutlineInputBorder _buildInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), // Circular border radius of 20
      borderSide: const BorderSide(color: Colors.grey), // Border color
    );
  }

  // Rest of your UI code...
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Center(
          child: sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? SizedBox(
                  width: size.width * 0.35,
                  child: _buildLayout(context),
                )
              : sizingInformation.deviceScreenType == DeviceScreenType.tablet
                  ? SizedBox(
                      width: size.width * 0.45,
                      child: _buildLayout(context),
                    )
                  : _buildLayout(context),
        );
      },
    );
  }

  Widget _buildLayout(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: sizingInformation.deviceScreenType != DeviceScreenType.mobile
                ? buttonColor.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: _buildInputBorder(),
                    enabledBorder: _buildInputBorder(),
                    focusedBorder: _buildInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: _buildInputBorder(),
                    enabledBorder: _buildInputBorder(),
                    focusedBorder: _buildInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: _buildInputBorder(),
                    enabledBorder: _buildInputBorder(),
                    focusedBorder: _buildInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: _buildInputBorder(),
                    enabledBorder: _buildInputBorder(),
                    focusedBorder: _buildInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : _registerUser, // Disable button when loading
                  child: const Text("Register"),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account? "),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
