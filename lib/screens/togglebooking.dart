import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'booking.dart';

class ToggleBooking extends StatefulWidget {
  @override
  _TogglepageState createState() => _TogglepageState();
}

class _TogglepageState extends State<ToggleBooking> {
  Future<bool> checkUserCollectionExists() async {
    var fireUser = FirebaseAuth.instance.currentUser!;
    final String userId = fireUser.uid;
    final String collectionName = 'Users/${userId}/Bookings';

    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection(collectionName).get();

    return snapshot.docs.isNotEmpty;
  }

  bool condition = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conditional Page Opening',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: condition ? BookingPage() : SecondPage(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Booking"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        backgroundColor: Colors.amber[100],
        body: Center(
          child: FutureBuilder<bool>(
            future: checkUserCollectionExists(),
            builder: (context, snapshot) {
              return BookingPage();
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return CircularProgressIndicator(
              //     backgroundColor: Colors.amber[100],
              //   );
              // } else if (snapshot.hasError) {
              //   return Text('Error: ${snapshot.error}');
              // } else if (snapshot.data == true) {
              //   return Center(
              //     child: Container(
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [Colors.orange, Colors.amber],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //         ),
              //         borderRadius: BorderRadius.circular(10.0),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.4),
              //             offset: Offset(0, 2),
              //             blurRadius: 4.0,
              //           ),
              //         ],
              //       ),
              //       padding: EdgeInsets.all(20.0),
              //       child: Text(
              //         'Booking Has been placed Succesfully check status from View Booking Page',
              //         style: TextStyle(
              //           fontSize: 30.0,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: 'Pacifico',
              //           letterSpacing: 2.0,
              //           shadows: [
              //             Shadow(
              //               color: Colors.black.withOpacity(0.3),
              //               offset: Offset(2, 2),
              //               blurRadius: 6.0,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   );
              //
              //   /*Center(
              //         child: Text(
              //           'Booking Has been placed Succesfully check status from View Booking Page',
              //           textAlign: TextAlign.justify,
              //           style: TextStyle(fontSize: 24),
              //         ),
              //       ),
              //     ),
              //   );*/
              // } else {
              //   return BookingPage();
              // }
            },
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
    );
  }
}
