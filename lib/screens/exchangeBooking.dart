import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/CartItemsProvider.dart';
import '../components/ExchangeBookingItem.dart';
import 'AddToCartPage.dart';

class ExchangeBookingPage extends StatefulWidget {
  const ExchangeBookingPage({Key? key}) : super(key: key);

  @override
  State<ExchangeBookingPage> createState() => ExchangeBookingPageState();
}

class ExchangeBookingPageState extends State<ExchangeBookingPage> {
  //final auth = FirebaseAuth.instance ;
  final complainController = TextEditingController();
  //int value = 0;
  int? _value = 1;
  int? col = 0;
  String colorr = "Null";
  int price = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setcolor() {
    if (col == 1) {
      colorr = "Red";
    } else if (col == 2) {
      colorr = "Yellow";
    } else {
      colorr = "Grey";
    }
  }

  void setprice() {
    if (_value == 45) {
      price = 9000;
    } else if (_value == 12) {
      price = 5000;
    } else {
      price = 3000;
    }
  }

  void addExchangeBookingToCart() {
    var time = DateTime.now();

    if (_value != null && col != null) {
      var exchangeBookingItem = ExchangeBookingItem(
        id: '', // Generate unique ID or use timestamp
        size: '$_value', // Adjust size value according to your requirement
        color: colorr,
        time: DateFormat("jms").format(time),
        date: DateFormat("yMMMMd").format(time),
        payment: 'Pending',
        deliveryBoy: 'Pending',
        status: 'Pending',
        isActive: 'true',
        price: price,
      );

      // Access the CartItemsProvider instance
      var cartItemsProvider = Provider.of<CartItemsProvider>(context, listen: false);

      // Add the exchange booking item to the exchange booking items list
      cartItemsProvider.addToExchangeBooking(exchangeBookingItem);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddToCartPage(),
        ),
      );
    } else {
      // Handle case where _value or col is null
    }
  }
  Future Addexchangebooking() async {
    var time = DateTime.now();
    var FireUser = FirebaseAuth.instance.currentUser!;
    if (_value != 1 && col != 0) {
      await FirebaseFirestore.instance
          .collection('Exchange Booking')
          .doc(FireUser.uid)
          .set({
        'Size': _value.toString() + "kg",
        'Color': colorr.toString(),
        'Time': DateFormat("jms").format(time).toString(),
        'Date': DateFormat("yMMMMd").format(time).toString(),
        'Payment': ('Pending'),
        'Delivery boy': ('Pending'),
        'Status': ('Pending'),
        'price': price.toString(),
        'isActive': ('true'),
      });
      showsucess('Exchange Order has been placed');
    } else {
      showerror('select all options');
    }
  }

  void showsucess(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
            size: 60.0,
          ),
          backgroundColor: Colors.orangeAccent[200],
          title: Center(
              child: Column(
            children: [
              Text(
                message,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "Total = " + price.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        );
      },
    );
  }

  void showerror(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.error,
            color: Colors.red,
            size: 60.0,
          ),
          backgroundColor: Colors.orangeAccent[200],
          title: Center(
              child: Text(
            message,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exchange Booking"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'images/KG.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10.0),

            Text(
              'Enter Exchange Booking Details',
              style: GoogleFonts.montserrat(
                  fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25.0),
            // Note: Same code is applied for the TextFormField as well
            Text(
              'Select Cylinder Size',
              style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),

            //radio box for size selection
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Radio(
                      value: 45,
                      groupValue: _value,
                      activeColor: Colors.orangeAccent,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const Text('45 KG',
                        style:
                            TextStyle(fontFamily: 'calibri', fontSize: 15.0)),
                    const Text('(Rs 9000)',
                        style: TextStyle(
                            fontFamily: 'calibri',
                            fontSize: 15.0,
                            color: Colors.red)),
                  ],
                ),
                const SizedBox(width: 45.0),
                Column(
                  children: [
                    Radio(
                      value: 12,
                      groupValue: _value,
                      activeColor: Colors.orangeAccent,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const Text('12 KG',
                        style:
                            TextStyle(fontFamily: 'calibri', fontSize: 15.0)),
                    const Text('(Rs 5000)',
                        style: TextStyle(
                            fontFamily: 'calibri',
                            fontSize: 15.0,
                            color: Colors.red)),
                  ],
                ),
                const SizedBox(width: 45.0),
                Column(
                  children: [
                    Radio(
                      value: 6,
                      activeColor: Colors.orangeAccent,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const Text('6 KG',
                        style:
                            TextStyle(fontFamily: 'calibri', fontSize: 15.0)),
                    const Text('(Rs 3000)',
                        style: TextStyle(
                            fontFamily: 'calibri',
                            fontSize: 15.0,
                            color: Colors.red)),
                  ],
                ),
              ],
            ),

            // Radio box for color selection

            const SizedBox(height: 25.0),
            // Note: Same code is applied for the TextFormField as well
            Text(
              'Select Cylinder color ',
              style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),

            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: col,
                      activeColor: Colors.orangeAccent,
                      onChanged: (value) {
                        setState(() {
                          col = value;
                        });
                      },
                    ),
                    const Text('Red',
                        style:
                            TextStyle(fontFamily: 'calibri', fontSize: 15.0)),
                  ],
                ),
                const SizedBox(width: 45.0),
                Column(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: col,
                      activeColor: Colors.orangeAccent,
                      onChanged: (value) {
                        setState(() {
                          col = value;
                        });
                      },
                    ),
                    const Text('Yellow',
                        style:
                            TextStyle(fontFamily: 'calibri', fontSize: 15.0)),
                  ],
                ),
                const SizedBox(width: 45.0),
                Column(
                  children: [
                    Radio(
                      value: 3,
                      activeColor: Colors.orangeAccent,
                      groupValue: col,
                      onChanged: (value) {
                        setState(() {
                          col = value;
                        });
                      },
                    ),
                    const Text('Grey',
                        style:
                            TextStyle(fontFamily: 'calibri', fontSize: 15.0)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25.0),

            ElevatedButton(
                onPressed: () {
                  setcolor();
                  setprice();
                  addExchangeBookingToCart();
                 // Addexchangebooking();
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
                  children: const [
                    Icon(
                      // <-- Icon
                      Icons.shopping_cart,
                      size: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Place order',
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
