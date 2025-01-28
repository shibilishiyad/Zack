// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class CustomDrawer extends StatelessWidget {
//   final FlutterSecureStorage storage;

//   const CustomDrawer({super.key, required this.storage});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.white,
//       child: Column(
//         children: [
//           DrawerHeader(
//             decoration:const BoxDecoration(
//               color: Colors.black,  // Set the header color here
//             ),
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               alignment: Alignment.center,  // Center the text within the header
//               child: const Text(
//                 'ZACK',
//                 style: TextStyle(
//                   fontSize: 60,
//                   fontWeight: FontWeight.w600,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 8.0,
//                       color: Colors.white,
//                       offset: Offset(4.0, 4.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushReplacementNamed(context, '/profile');
//                   },
//                   child: const ListTile(
//                     leading: Padding(
//                       padding: EdgeInsets.only(top: 20, left: 0),
//                       child: Icon(
//                         Icons.person,
//                         size: 35,
//                       ),
//                     ),
//                     title: Padding(
//                       padding: EdgeInsets.only(top: 20, right: 0),
//                       child: Text(
//                         'Profile',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const ListTile(
//                   leading: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child: Icon(
//                       Icons.badge,
//                       color: Colors.black,
//                       size: 35,
//                     ),
//                   ),
//                   title: Padding(
//                     padding: EdgeInsets.only(top: 35, left: 10),
//                     child: Text(
//                       'Orders',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/settings');
//                   },
//                   child: const ListTile(
//                     leading: Padding(
//                       padding: EdgeInsets.only(top: 30),
//                       child: Icon(
//                         Icons.settings,
//                         color: Colors.black,
//                         size: 35,
//                       ),
//                     ),
//                     title: Padding(
//                       padding: EdgeInsets.only(top: 35, left: 10),
//                       child: Text(
//                         'Settings',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     await storage.deleteAll();
//                     Navigator.pushReplacementNamed(context, '/splash');
//                   },
//                   child: const ListTile(
//                     leading: Padding(
//                       padding: EdgeInsets.only(top: 30),
//                       child: Icon(
//                         Icons.logout,
//                         color: Colors.black,
//                         size: 35,
//                       ),
//                     ),
//                     title: Padding(
//                       padding: EdgeInsets.only(top: 35, left: 10),
//                       child: Text(
//                         'Logout',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
