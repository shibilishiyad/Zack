// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zack_shoping/view/display.dart';
import 'package:zack_shoping/view/order_complete.dart';
import 'package:zack_shoping/view/register.dart';
import 'package:zack_shoping/widgets/logbutton.dart';
import 'package:zack_shoping/widgets/textfield.dart';

// ignore: must_be_immutable
class Loginscreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginkey = GlobalKey<FormState>();

  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F3F3),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/Asset/image/login_image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _loginkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight / 2.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Mywidgets().mytextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter an Email id";
                            }
                            return null;
                          },
                          labelText: 'Email',
                          width: screenWidth - 20,
                          controller: _emailController,
                        ),
                        SizedBox(height: 10),
                        Mywidgets().mytextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is mandatory";
                            }
                            return null;
                          },
                          labelText: 'Password',
                          width: screenWidth - 20,
                          controller: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth / 2.8),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Have you forgotten your password?',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'Sign In',
                    bwidth: screenWidth - 20,
                    onPressed: () async {
                      if (_loginkey.currentState!.validate()) {
                        try {
                          // Try to sign in the user
                          UserCredential userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim());

                          // Navigate to ExploreScreen on successful login
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  OrderCompletePage(),
                              transitionsBuilder:
                                  (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          // If sign in fails, check for user-not-found error
                          if (e.code == 'user-not-found') {
                            // If user not found, create a new user
                            try {
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim());

                              // Navigate to ExploreScreen on successful registration
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                         ProductDisplayPage(index: -1,),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } catch (e) {
                              print("Registration failed: $e");
                            }
                          } else {
                            print("Login failed: ${e.message}");
                          }
                        }
                      }
                    },
                  ),
                  CustomButton(
                    text: ' Register',
                    bwidth: screenWidth - 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              Register(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
