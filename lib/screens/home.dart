import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/RoundedCarouselSlider.dart';
import 'package:first_app/screens/Viewbooking.dart';
import 'package:first_app/screens/realt.dart';
import 'package:first_app/screens/togglebooking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:first_app/screens/ViewUser.dart';
import 'AddToCartPage.dart';
import 'ViewExchangeBooking.dart';
import 'complain.dart';
import 'exchangeBooking.dart';

class Homage extends StatefulWidget {
  const Homage({super.key});
  @override
  State<Homage> createState() => _HomageState();
}

class _HomageState extends State<Homage> {
  //variables for diaplay name
  // ignore: non_constant_identifier_names
  var f_name = "";
  // ignore: non_constant_identifier_names
  var l_name = '';


  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  final List<String> cylinder_img = [
    'assets/cylinder_img/cylinder1.png',
    'assets/cylinder_img/cylinder2.png'
  ];

  @override
  void dispose() {
    super.dispose();
  }

  // sign user in method
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.black12,
            color: Colors.orangeAccent,
          ));
        });
    //try for email/password login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //pop indicator
      Navigator.pop(context);
    }
    // firebase exception handling
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 60.0,
          ),
          backgroundColor: Colors.orangeAccent[200],
          title: Center(
              child: Text(
            message,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
        );
      },
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ViewUserPage();
            }));
          },
          iconSize: 30.0,
          color: Colors.brown[800],
          icon: const Icon(Icons.person),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCartPage()),
              );
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
        ],
        title: const Text(''),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image welcome
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/banner1.png',
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomLeft,
                      height: 160,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '     Welcome Home',
                            style: GoogleFonts.montserrat(fontSize: 18.0),
                          ),
                          FutureBuilder(
                            future: _fetch(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return const Text(
                                  "    Dear Customer",
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                );
                              }
                              return Text(
                                "     $f_name" + " $l_name",
                                style: GoogleFonts.bebasNeue(fontSize: 30.0),
                              );
                            },
                          ),
                          /* Text(
                            '    Smart Peoples',
                            style: GoogleFonts.bebasNeue(fontSize: 30.0),
                          ),*/
                        ],
                      )),
                ],
              ),

              const SizedBox(height: 25),

              RoundedCarouselSlider(images: (cylinder_img)),

              const SizedBox(height: 20),

              Row(
                children: [
                  const SizedBox(width: 30),
                  // sign in button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PostScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(140.0, 150.0),
                          elevation: 4.0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            // <-- Icon
                            Icons.monitor_heart_sharp,
                            size: 50.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Real-Time Monitoring',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),

                  const SizedBox(width: 20),

                  // sign in button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ToggleBooking();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(140.0, 150.0),
                          elevation: 4.0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_online,
                            size: 50.0,
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            'Apply for New Booking',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  const SizedBox(width: 30),
                  // sign in button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewBookingPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          // padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                          fixedSize: Size(140.0, 150.0),
                          elevation: 4.0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            // <-- Icon
                            Icons.view_timeline_rounded,
                            size: 50.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'View Booking Details',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),

                  const SizedBox(width: 20),

                  // sign in button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ExchangeBookingPage();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          //padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                          fixedSize: Size(140.0, 150.0),
                          elevation: 4.0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            // <-- Icon
                            Icons.recycling_sharp,
                            size: 50.0,
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            'Apply for Exchange Booking',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ViewExchangeBookingPage();
                    }));
                  },
                  //child: Text('Complaints & Queries'),
                  style: ElevatedButton.styleFrom(
                      // padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                      fixedSize: Size(300.0, 50.0),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        // <-- Icon
                        Icons.view_timeline_outlined,
                        size: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'View Exchange Booking',
                        style: TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),

              const SizedBox(height: 20),

              // sign in button
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const complainPage();
                    }));
                  },
                  //child: Text('Complaints & Queries'),
                  style: ElevatedButton.styleFrom(
                      // padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                      fixedSize: Size(300.0, 50.0),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        // <-- Icon
                        Icons.question_answer_outlined,
                        size: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Complaints & Queries',
                        style: TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    //if (firebaseUser != null)
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      f_name = ds.get('First Name');
      l_name = ds.get('Last Name');
    }).catchError((e) {
      print(e);
    });
  }
}
