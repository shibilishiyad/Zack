// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:zack_shoping/view/order_complete.dart';
import 'package:zack_shoping/widgets/logbutton.dart';
import 'package:zack_shoping/widgets/textfield.dart';

class Register extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _nameController = TextEditingController();

  final _loginkey = GlobalKey<FormState>();

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
                        SizedBox(height: 10),
                        Mywidgets().mytextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Name ";
                            }
                            return null;
                          },
                          labelText: 'Name',
                          width: screenWidth - 20,
                          controller: _nameController,
                        ),
                      ],
                    ),
                  ),
               
                  SizedBox(height: 60),
                 
                  CustomButton(
                    text: ' Register',
                    bwidth: screenWidth - 20,
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                   OrderCompletePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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


