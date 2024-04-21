import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewBookingPage extends StatefulWidget {
  const ViewBookingPage({Key? key}) : super(key: key);

  @override
  State<ViewBookingPage> createState() => ViewBookingPageState();
}

class ViewBookingPageState extends State<ViewBookingPage> {
  late List<DocumentSnapshot> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .collection('Bookings')
          .get();
      setState(() {
        bookings = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching bookings: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Card(
                    color: Colors.amber[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Size: ${booking['Size']}',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Color: ${booking['Color']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Smart Device Included: ${booking['Smart device Included']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Price: ${booking['price']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Date: ${booking['Date']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Time: ${booking['Time']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Payment: ${booking['Payment']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Delivery Boy: ${booking['Delivery boy']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Status: ${booking['Status']}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


//
// class ViewBookingPageState extends State<ViewBookingPage> {
//   //final auth = FirebaseAuth.instance ;
//   final complainController = TextEditingController();
//   var size = "";
//   var color = '';
//   var smartdevice = "";
//   var price = "";
//   var date = "";
//   var time = "";
//   var payment = "";
//   var delivery = "";
//   var status = "";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Booking Details"),
//         backgroundColor: Colors.orange,
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.amber[100],
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             /*  const SizedBox(height: 20.0),
//             Container(
//               alignment: Alignment.center,
//               child: Image.asset(
//                 'images/KG.png',
//                 height: 200,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             */
//             const SizedBox(height: 40.0),
//             Text(
//               'Booking Details',
//               style: GoogleFonts.montserrat(
//                   fontSize: 23.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Size    ',
//                           style: GoogleFonts.montserrat(
//                             fontSize: 18.0,
//                           ),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("  ");
//                             }
//                             return Text(
//                               "     $size",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Color    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("    ");
//                             }
//                             return Text(
//                               "     $color",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Smart device    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("    ");
//                             }
//                             return Text(
//                               "     $smartdevice",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '  Total Price    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("    ");
//                             }
//                             return Text(
//                               "     $price",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Date    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("    ");
//                             }
//                             return Text(
//                               "     $date",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Time    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("    ");
//                             }
//                             return Text(
//                               "     $time",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Payment    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("    ");
//                             }
//                             return Text(
//                               "     $payment",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Delivery Boy    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("   ");
//                             }
//                             return Text(
//                               "     $delivery",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             InkWell(
//               child: Card(
//                 color: Colors.amber[200],
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: Colors.amber,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '   Status    ',
//                           style: GoogleFonts.montserrat(fontSize: 18.0),
//                         ),
//                         FutureBuilder(
//                           future: _fetch(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Text("   ");
//                             }
//                             return Text(
//                               "     $status",
//                               style: TextStyle(fontSize: 20.0),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _fetch() async {
//     final firebaseUser = FirebaseAuth.instance.currentUser!;
//     //if (firebaseUser != null)
//     await FirebaseFirestore.instance
//         .collection('Booking')
//         .doc(firebaseUser.uid)
//         .get()
//         .then((ds) {
//       size = ds.get('Size');
//       color = ds.get('Color');
//       smartdevice = ds.get('Smart device Included');
//       price = ds.get('price');
//       date = ds.get('Date');
//       time = ds.get('Time');
//       payment = ds.get('Payment');
//       delivery = ds.get('Delivery boy');
//       status = ds.get('Status');
//     }).catchError((e) {
//       print(e);
//     });
//   }
// }
