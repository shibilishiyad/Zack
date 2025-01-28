import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage storing login (users data)
const storage = FlutterSecureStorage();

Future<bool> checkLoginStatus() async {
  // Read the value associated with the key 'isLogged'
  final value = await storage.read(
      key:
          'isloged'); //is loged is the key to chek the condition for user loged or not

  // Return false if the value is null, otherwise return true
  return value != null;
}
// Read value

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // this is for generating navigatior key  ; global key is the key used in this whole project

