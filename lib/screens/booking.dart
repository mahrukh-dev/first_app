import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/CartItems.dart';
import '../components/CartItemsProvider.dart';
import 'booking.dart';
import 'addToCartPage.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final complainController = TextEditingController();
  int? _value = 1;
  int? col = 0;
  String colorr = "Null";
  String smart = "Null";
  int price = 0;
  bool? isChecked = false;
  List<CartItem> cartItemsList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("New Booking"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),*/
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
              'Enter Booking Details',
              style: GoogleFonts.montserrat(
                  fontSize: 18.0, fontWeight: FontWeight.bold),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Include Smart Device (Rs 3000)        ',
                      style: GoogleFonts.montserrat(fontSize: 16.0),
                    ),
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.orange[700],
                      onChanged: (newbool) {
                        setState(() {
                          isChecked = newbool;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            //radio box for size selection
            const SizedBox(height: 5.0),
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
                    Text(
                      'Select Cylinder Size',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Radio(
                              value: 45,
                              groupValue: _value,
                              activeColor: Colors.orange[700],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            const Text('45 KG',
                                style: TextStyle(
                                    fontFamily: 'calibri', fontSize: 15.0)),
                            const Text('(Rs 13500)',
                                style: TextStyle(
                                    fontFamily: 'calibri',
                                    fontSize: 12.0,
                                    color: Colors.red)),
                          ],
                        ),
                        const SizedBox(width: 45.0),
                        Column(
                          children: [
                            Radio(
                              value: 12,
                              groupValue: _value,
                              activeColor: Colors.orange[700],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            const Text('12 KG',
                                style: TextStyle(
                                    fontFamily: 'calibri', fontSize: 15.0)),
                            const Text('(Rs 8000)',
                                style: TextStyle(
                                    fontFamily: 'calibri',
                                    fontSize: 12.0,
                                    color: Colors.red)),
                          ],
                        ),
                        const SizedBox(width: 45.0),
                        Column(
                          children: [
                            Radio(
                              value: 6,
                              activeColor: Colors.orange[700],
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            const Text('6 KG',
                                style: TextStyle(
                                    fontFamily: 'calibri', fontSize: 15.0)),
                            const Text('(Rs 5000)',
                                style: TextStyle(
                                    fontFamily: 'calibri',
                                    fontSize: 12.0,
                                    color: Colors.red)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),

            // Radio box for color selection

            const SizedBox(height: 5.0),
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
                    // Note: Same code is applied for the TextFormField as well
                    Text(
                      'Select Cylinder color ',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: col,
                              activeColor: Colors.red,
                              onChanged: (value) {
                                setState(() {
                                  col = value;
                                });
                              },
                            ),
                            const Text('Red',
                                style: TextStyle(
                                    fontFamily: 'calibri',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
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
                                style: TextStyle(
                                    fontFamily: 'calibri',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange)),
                          ],
                        ),
                        const SizedBox(width: 45.0),
                        Column(
                          children: [
                            Radio(
                              value: 3,
                              activeColor: Colors.grey,
                              groupValue: col,
                              onChanged: (value) {
                                setState(() {
                                  col = value;
                                });
                              },
                            ),
                            const Text('Grey',
                                style: TextStyle(
                                    fontFamily: 'calibri',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15.0),

            ElevatedButton(
                onPressed: () {
                  setdevice();
                  setcolor();
                  setprice();
                  addBookingToCart();
                },
                style: ElevatedButton.styleFrom(
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

  void setprice() {
    if (_value == 45) {
      price = 13500;
    } else if (_value == 12) {
      price = 8000;
    } else {
      price = 5000;
    }
    setfinalprice();
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

  void setdevice() {
    if (isChecked.toString() == "true") {
      smart = "Yes";
    } else {
      smart = "No";
    }
  }

  void setfinalprice() {
    if (smart == 'Yes') {
      price = price + 3000;
    } else {}
  }


  void addBookingToCart() {
    var time = DateTime.now();

    if (_value != null && col != null) {
      var cartItem = CartItem(
        id: '', // Generate unique ID or use timestamp
        productName: 'Cylinder Booking',
        smartDeviceIncluded: smart,
        size: '$_value kg',
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

      // Add the cart item to the cart items list
      cartItemsProvider.addToCart(cartItem);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddToCartPage(),
        ),
      );
      // Add the cart item to the list of cart items
      // cartItemsList.add(cartItem);
      //
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => AddToCartPage(cartItems: cartItemsList),
      //   ),
      // );
    } else {
      // Show error message
    }
  }
}