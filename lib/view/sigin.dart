// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:zack_shoping/utils/storage.dart';
import 'package:zack_shoping/view/home.dart';
import 'package:zack_shoping/view/siginup.dart';
import 'package:zack_shoping/widgets/loginbutton.dart';

class Loginscreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(215, 168, 147, 0.537),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Color.fromRGBO(215, 168, 147, 0.537),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Hello Again!',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Welcome Back You\'ve Been Missed!',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Shibilishiyad@gmail.com',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '*******',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => print('Recover Password'),
                      child: Text(
                        'Recovery Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        if (email.contains('@gmail.com') &&
                            password.length >= 6) {
                          // Write value
                          storage.write(key: 'isloged', value: 'true');
                          navigatorKey.currentState
                              ?.pushReplacementNamed('/home');
                        } else {
                          // Handle invalid email or password
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  'Error',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: Text(
                                  'Invalid email or password.',
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Sign In'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Signup()),
                //     );
                //   },
                //   child: Text('Sign in with Google',style: TextStyle(color: Colors.black),),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // TextButton(
                //   onPressed: () {
                //     // Navigate to sign-up screen
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Signup()),
                //     );
                //   },
                //   child: Text('Sign Up For Free',style: TextStyle(color: Colors.black),),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    child: Button().textbutton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      text: 'Sign-up',
                      fontSize: 16,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text('Or'),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    child: Button().textbutton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      text: 'Sign in with Google',
                      image: Image.asset(
                        'lib/Asset/image/product_img/icons8-google-48.png',
                        height: 57,
                        width: 32,
                      ),
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    //  return Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       backgroundColor: Colors.black12,
    //     ),
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child: SingleChildScrollView(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const Padding(
    //                   padding: EdgeInsets.only(left: 16, top: 27),
    //                   child: Text(
    //                     'Welcome,',
    //                     style: TextStyle(
    //                       fontSize: 32,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 8),
    //                 const Padding(
    //                   padding: EdgeInsets.only(left: 16),
    //                   child: Text(
    //                     'Enter Your Credentials to Continue',
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 30),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(left: 10, right: 10, top: 17),
    //                   child: SizedBox(
    //                     width: MediaQuery.of(context).size.width - 20,
    //                     child: Mywidgets().mytextField(
    //                       labelText: 'Email ID',
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 20),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 10),
    //                   child: SizedBox(
    //                     width: MediaQuery.of(context).size.width - 20,
    //                     child: Mywidgets().mytextField(
    //                       labelText: 'Password',
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 10),
    //                 const Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     RememberMeCheckbox(),
    //                     Padding(
    //                       padding: EdgeInsets.only(right: 10),
    //                       child: Text(
    //                         'Forgot Password ?',
    //                         style: TextStyle(color: Colors.blue),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(height: 20),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 10),
    //                   child: SizedBox(
    //                     height: 50,
    //                     width: MediaQuery.of(context).size.width - 20,
    //                     child: Button().textbutton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => HomeScreen()),
    //                         );
    //                       },
    //                       text: 'Sign-In',
    //                       fontSize: 16,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 10),
    //                 const Center(
    //                   child: Text('Or'),
    //                 ),
    //                 const SizedBox(height: 10),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 10),
    //                   child: SizedBox(
    //                     height: 50,
    //                     width: MediaQuery.of(context).size.width - 20,
    //                     child: Button().textbutton(
    //                       onPressed: () {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => const HomeScreen()),
    //                         );
    //                       },
    //                       text: 'Sign in with Google',
    //                       image: Image.asset(
    //                         'asset/images/icons8-google-48.png',
    //                         height: 57,
    //                         width: 32,
    //                       ),
    //                       backgroundColor:
    //                           const Color.fromARGB(165, 255, 255, 255),
    //                       textColor: Colors.black,
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 20),
    //                 Center(
    //                   child: RichText(
    //                     text: TextSpan(
    //                       text: 'Do you have an account? ',
    //                       style: const TextStyle(color: Colors.black),
    //                       children: <TextSpan>[
    //                         TextSpan(
    //                           text: 'Sign-Up',
    //                           style: const TextStyle(
    //                             color: Colors.blue,
    //                             decoration: TextDecoration.underline,
    //                           ),
    //                           recognizer: TapGestureRecognizer()
    //                             ..onTap = () {
    //                               // Navigator.push(
    //                               //   context,
    //                               //   MaterialPageRoute(
    //                               //     builder: (context) => const MobileSignup(),
    //                               //   ),
    //                               // );
    //                             },
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 20),
    //               ],
    //             ),
    //           ),
    //         ),

    //       ],
    //     ),
    //   );
  }
}
