import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/Disease Screens/disease_screen.dart';
import '../screens/about_us.dart';
import '../screens/auth-ui/history.dart';
import '../screens/auth-ui/signin_screen.dart';
import '../screens/contact_us.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/history_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.3,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 160,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              padding: EdgeInsets.only(left: 10),
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  } else {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final user =
                          snapshot.data!.data(); // Accessing the data of
                      // the first document
                      // if (user != null) {
                      // return Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     SizedBox(height: 30),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 30,
                      //           backgroundColor: Colors.grey,
                      //           child: Text(
                      //             getInitials(user['name']),
                      //             style: TextStyle(
                      //                 fontSize: 24, color: Colors.white),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               user['name'] ?? 'Name not available',
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 18,
                      //               ),
                      //             ),
                      //             Text(
                      //               user['email'] ?? 'Email not available',
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 14,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // );

                      // }
                      if (user != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // CircleAvatar(
                                //   radius: 30,
                                //   backgroundColor: Colors.grey,
                                //   child: Text(
                                //     getInitials(
                                //         user['username'] ?? ''), // Safe access
                                //     style: TextStyle(
                                //         fontSize: 24, color: Colors.white),
                                //   ),
                                // ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: user['userImg'] != null
                                      ? NetworkImage(user['userImg'])
                                      // Corrected to use user['userImg']
                                      : null,
                                  // Fallback to default if no URL provided
                                  child: user['userImg'] == null
                                      ? Text(
                                          getInitials(user['username'] ??
                                              ''), // Safe access
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        )
                                      : null, // Don't display initials if
                                  // the image is available
                                ),

                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['username'] ??
                                          'Name not available', // Safe access
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      user['email'] ??
                                          'Email not available', // Safe access
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Text('Data is not available');
                    }
                  }
                },
              ),
            ),
          ),
          ListTile(
            selectedTileColor: Colors.green,
            leading: Icon(Icons.person),
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()));
            },
          ),
          ListTile(
            selectedTileColor: Colors.green,
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => HistoryScreen()));
                  MaterialPageRoute(builder: (context) => HostoryScreen()));
            },
          ),
          ListTile(
            selectedTileColor: Colors.green,
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
          ListTile(
            selectedTileColor: Colors.green,
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          ListTile(
            selectedTileColor: Colors.green,
            leading: const Icon(Icons.local_florist),
            title: const Text('Disease Categories'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DiseasePage()));
            },
          ),
          Divider(),
          ListTile(
            selectedTileColor: Colors.green,
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Close the drawer
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}

// String getInitials(String fullName) {
//   List<String> names = fullName.split(' ');
//   String initials = '';
//   int numWords = names.length > 2 ? 2 : names.length;
//   for (int i = 0; i < numWords; i++) {
//     initials += '${names[i][0]}';
//   }
//   return initials.toUpperCase();
// }
String getInitials(String fullName) {
  if (fullName.isEmpty) return ''; // Return empty if the full name is empty

  List<String> names = fullName.split(' ');
  String initials = '';
  int numWords = names.length > 2 ? 2 : names.length;
  for (int i = 0; i < numWords; i++) {
    if (names[i].isNotEmpty) {
      initials += '${names[i][0]}';
    }
  }
  return initials.toUpperCase();
}
