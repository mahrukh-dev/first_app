import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewExchangeBookingPage extends StatefulWidget {
  const ViewExchangeBookingPage({Key? key}) : super(key: key);

  @override
  State<ViewExchangeBookingPage> createState() =>
      ViewExchangeBookingPageState();
}

class ViewExchangeBookingPageState extends State<ViewExchangeBookingPage> {
  //final auth = FirebaseAuth.instance ;
  final complainController = TextEditingController();
  var size = "";
  var color = '';
  var price = "";
  var date = "";
  var time = "";
  var payment = "";
  var delivery = "";
  var status = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exchange Bookings"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'images/KG.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            */
            const SizedBox(height: 40.0),
            Text(
              'Exchange Booking Details',
              style: GoogleFonts.montserrat(
                  fontSize: 23.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Size    ',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.0,
                          ),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("  ");
                            }
                            return Text(
                              "     $size",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Color    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("    ");
                            }
                            return Text(
                              "     $color",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Price    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("    ");
                            }
                            return Text(
                              "     $price",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Date    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("    ");
                            }
                            return Text(
                              "     $date",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Time    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("    ");
                            }
                            return Text(
                              "     $time",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Payment    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("    ");
                            }
                            return Text(
                              "     $payment",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Delivery Boy    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("   ");
                            }
                            return Text(
                              "     $delivery",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              child: Card(
                color: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   Status    ',
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text("   ");
                            }
                            return Text(
                              "     $status",
                              style: TextStyle(fontSize: 20.0),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    //if (firebaseUser != null)
    await FirebaseFirestore.instance
        .collection('Exchange Booking')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      size = ds.get('Size');
      color = ds.get('Color');
      price = ds.get('price');
      date = ds.get('Date');
      time = ds.get('Time');
      payment = ds.get('Payment');
      delivery = ds.get('Delivery boy');
      status = ds.get('Status');
    }).catchError((e) {
      print(e);
    });
  }
}
