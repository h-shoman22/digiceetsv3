// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main/HomePage.dart'; // Import your home page file
import 'package:main/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  
  // ignore: library_private_types_in_public_api

  _LoginPageState createState() => _LoginPageState();

  
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      // Check if the user has been logged in successfully
      if (userCredential.user != null) {
        // Display success message
        Get.snackbar(
          'Success',
          'Logged in successfully!',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );

        // Navigate to home page
        Get.to(() => HomePage());
      }
    } catch (e) {
      // Display error message
      Get.snackbar(
        'Error',
        'Login failed. Check your email and password.',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/loginimage.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Noto',
                    ),
                  ),
                  Text(
                    "Sign into your Account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 216, 216, 216),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 216, 216, 216),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black, boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          prefixIcon:
                              Icon(Icons.email, color: Colors.green[800]),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 106, 106, 106),
                                  width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 106, 106, 106),
                                  width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black, boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password Here",
                          prefixIcon:
                              Icon(Icons.password, color: Colors.green[800]),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 106, 106, 106),
                                  width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 106, 106, 106),
                                  width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password action
                          print("Forgot your Password?");
                        },
                        child: Text(
                          "Forgot your Password?",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _signInWithEmailAndPassword,
                      child: Container(
                        width: width * 0.5,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("images/imgbutton.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Noto',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 202, 202, 202),
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage()),
                        children: [
                          TextSpan(
                            text: " Create",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => SignUpPage()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
