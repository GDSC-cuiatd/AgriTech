// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.black.withOpacity(0.5),
//         title: Text(
//           'History',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         //backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: true,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/images/background.jpg'), // Adjust the path to your background image
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .collection('History')
//               .orderBy('timestamp', descending: true)
//               .limit(5)
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }
//             if (snapshot.data!.docs.isEmpty) {
//               return Center(
//                   child: Text(
//                 'No history available',
//                 style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ));
//             }
//             return ListView.builder(
//               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var doc = snapshot.data!.docs[index];
//                 return Card(
//                   margin: EdgeInsets.symmetric(vertical: 8),
//                   child: ListTile(
//                     leading: Container(
//                       color: Colors.green,
//                       child: Image.network(
//                         doc['imageUrl'],
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     title: Text(doc['name']),
//                     subtitle: Text('Accuracy ${doc['accuracy']}%'),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure that we have a current user logged in
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // No user is logged in
      return Scaffold(
        appBar: AppBar(
          title: Text('History'),
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
        body: Center(
          child: Text('Please log in to view history'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.5),
        title: Text(
          'History',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .collection('History')
              .orderBy('timestamp', descending: true)
              .limit(5)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              print('Error retrieving history: ${snapshot.error}');
              return Center(
                  child: Text(
                      'Error retrieving history. Please try again later.'));
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                  child: Text(
                'No history available',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ));
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var doc = snapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Container(
                      color: Colors.green,
                      child: Image.network(
                        doc['imageUrl'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(doc['name']),
                    subtitle: Text('Accuracy ${doc['accuracy']}%'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
