import 'package:flutter/material.dart';
import 'package:zack_shoping/utils/storage.dart';
import 'package:zack_shoping/view/home.dart';
import 'package:zack_shoping/view/profile.dart';
import 'package:zack_shoping/view/settings.dart';
import 'package:zack_shoping/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = await checkLoginStatus();

  runApp(myApp(
    isLoaded: isLoggedIn,
  ));
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  final bool isLoaded;
  const myApp({super.key, required this.isLoaded});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoaded ? '/home' : '/splash',
      routes: {
        // '/login': (context) => Loginscreen(), // creating route key
        '/home': (context) => const HomeScreen(),
        // '/sp': (context) => const Splashscreen(),
        '/splash': (context) => const VideoScreen(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}




