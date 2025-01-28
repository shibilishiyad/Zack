import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/firebase_options.dart';
import 'package:zack_shoping/controllers/provider/cart_provider.dart';
import 'package:zack_shoping/controllers/provider/fav_provider.dart';
import 'package:zack_shoping/controllers/provider/notification_provider.dart';
import 'package:zack_shoping/view/bottombar.dart';
import 'package:zack_shoping/view/display.dart';
import 'package:zack_shoping/view/login.dart';
import 'package:zack_shoping/view/profile.dart';
import 'package:zack_shoping/view/settings.dart';
import 'package:zack_shoping/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context)=>FavoriteProvider()),
          ChangeNotifierProvider(create: (context)=>CartProvider()),
           ChangeNotifierProvider(create: (context)=>NotificationProvider()),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: VideoScreen(),
        routes: {
          '/home': (context) => const ProductDisplayPage(
                index: -9,
              ),
          '/splash': (context) => const VideoScreen(),
          '/profile': (context) => const ProfilePage(),
          '/settings': (context) => const Settings(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // User is logged in, navigate to ExploreScreen
          return const MainBottombar(
            initialIndex: 0,
          );
        } else {
          // User is not logged in, show LoginScreen
          return Loginscreen();
        }
      },
    );
  }
}
