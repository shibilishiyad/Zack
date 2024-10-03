// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:zack_shoping/view/home.dart';

class Signup extends StatelessWidget {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Define form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign Up',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(215, 168, 147, 0.537),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Color.fromRGBO(215, 168, 147, 0.537),
          color: Colors.white,
          child: Form(
            key: _formKey, // Assign form key
            child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Update username state here
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Update email state here
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Update password state here
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate form fields using form key
                        if (_formKey.currentState!.validate()) {
                          // If all fields are valid, navigate to home page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                          // Perform sign-up logic here
                          // For demonstration, just print the entered data
                          var _username;
                          print('Username: $_username');
                          var _email;
                          print('Email: $_email');
                          var _password;
                          print('Password: $_password');
                        }
                      },
                      child: Text('Sign Up'),
                       style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
                    ),
                  ),
                  // SizedBox(height: 30.0),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Divider(),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
