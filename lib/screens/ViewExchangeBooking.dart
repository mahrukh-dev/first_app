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
  final complainController = TextEditingController();
  List<Map<String, dynamic>> exchangeBookings = [];

  @override
  void initState() {
    super.initState();
    _fetch();
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
          children: [
            SizedBox(height: 20.0),
            Text(
              'Exchange Booking Details',
              style: GoogleFonts.montserrat(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: exchangeBookings.length,
              itemBuilder: (context, index) {
                return _buildExchangeBookingCard(exchangeBookings[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExchangeBookingCard(Map<String, dynamic> booking) {
    return InkWell(
      child: Card(
        color: Colors.amber[200],
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            _buildBookingDetailRow("Size", booking['size']),
            _buildBookingDetailRow("Color", booking['color']),
            _buildBookingDetailRow("Price", booking['price']),
            _buildBookingDetailRow("Date", booking['date']),
            _buildBookingDetailRow("Time", booking['time']),
            _buildBookingDetailRow("Payment", booking['payment']),
            _buildBookingDetailRow("Delivery Boy", booking['deliveryBoy']),
            _buildBookingDetailRow("Status", booking['status']),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingDetailRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '   $label    ',
          style: GoogleFonts.montserrat(fontSize: 18.0),
        ),
        Text(
          "     $value",
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .collection('ExchangeBookings') // Updated collection name
          .get();
      setState(() {
        exchangeBookings = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print('Error fetching exchange bookings: $e');
    }
  }
}
