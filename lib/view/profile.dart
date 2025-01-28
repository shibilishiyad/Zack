import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/provider/notification_provider.dart';
import 'package:zack_shoping/view/notification.dart';

import 'package:zack_shoping/view/settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // if (notificationProvider.hasNewNotifications) {
                  //   notificationProvider.clearNotifications();
                  // }
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //       notificationProvider.hasNewNotifications
                  //           ? "You have new notifications!"
                  //           : "No new notifications",
                  //     ),
                  //   ),
                  // );
                     Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                         NotificationPage(),
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
              if (notificationProvider.hasNewNotifications)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Align(
                  alignment: Alignment(0.0, -0.5),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/Asset/image/shibili.jpeg'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Shibili Shiyad',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                 Text(
                  'shibili@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Settings(),
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
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Privacy Settings'),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notification Settings'),
              onTap: () {
                // Navigate to notification settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                // Navigate to help & support
              },
            ),
          ],
        ),
      ),
    );
  }
}
