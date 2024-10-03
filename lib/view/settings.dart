import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

       appBar: AppBar(
        title:const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading:const Icon(Icons.account_circle),
            title: const Text('Account'),
            subtitle:const Text('Manage your account settings'),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          ListTile(
            leading:const Icon(Icons.notifications),
            title:const Text('Notifications'),
            subtitle:const Text('Manage notification preferences'),
            onTap: () {
              // Navigate to notifications settings page
            },
          ),
          ListTile(
            leading:const Icon(Icons.security),
            title:const Text('Privacy'),
            subtitle:const Text('Manage privacy settings'),
            onTap: () {
              // Navigate to privacy settings page
            },
          ),
          ListTile(
            leading:const Icon(Icons.color_lens),
            title:const Text('Theme'),
            subtitle:const Text('Choose a theme'),
            onTap: () {
              // Navigate to theme settings page
            },
          ),
          SwitchListTile(
            secondary:const Icon(Icons.dark_mode),
            title:const Text('Dark Mode'),
            value: false, // This should be a variable controlled by state
            onChanged: (bool value) {
              // Handle dark mode toggle
            },
          ),
          ListTile(
            leading:const Icon(Icons.language),
            title:const Text('Language'),
            subtitle:const Text('Select language'),
            onTap: () {
              // Navigate to language settings page
            },
          ),
          ListTile(
            leading:const Icon(Icons.help),
            title:const Text('Help & Support'),
            onTap: () {
              // Navigate to help & support page
            },
          ),
          ListTile(
            leading:const Icon(Icons.info),
            title:const Text('About'),
            onTap: () {
              // Navigate to about page
            },
          ),
        ],
      ),

    );
  }
}