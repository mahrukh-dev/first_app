import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/CartItems.dart';
import '../components/CartItemsProvider.dart';
import '../components/ExchangeBookingItem.dart';
import 'booking.dart';
import 'home.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({Key? key}) : super(key: key);

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    var cartItemProvider = Provider.of<CartItemsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Cart'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Cart Items',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItemProvider.cartItemsList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItemProvider.cartItemsList[index];
                  return _buildCartItem(cartItem);
                },
              ),
            ),
            const SizedBox(
                height:
                    20), // Add some spacing between cart items and exchange bookings
            Text(
              'Exchange Bookings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItemProvider.exchangeBookingItemsList.length,
                itemBuilder: (context, index) {
                  final exchangeBookingItem =
                      cartItemProvider.exchangeBookingItemsList[index];
                  return _buildExchangeBookingItem(exchangeBookingItem);
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                cartItemProvider.cartItemsList.forEach((cartItem) {
                  addCartItemToFirestore(cartItem);
                });
                cartItemProvider.exchangeBookingItemsList
                    .forEach((exchangeBookingItem) {
                  addExchangeBookingToFirestore(exchangeBookingItem);
                });
                cartItemProvider.clearCart();
                cartItemProvider.clearExchangeBookingItems();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Order Confirmed'),
                      content: Text('Your order has been confirmed.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homage()),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExchangeBookingItem(ExchangeBookingItem exchangeBookingItem) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    //        Text('ID: ${exchangeBookingItem.id}',
      //          style: TextStyle(fontSize: 16)),
            Text('Size: ${exchangeBookingItem.size}',
                style: TextStyle(fontSize: 16)),
            Text('Color: ${exchangeBookingItem.color}',
                style: TextStyle(fontSize: 16)),
            Text('Time: ${exchangeBookingItem.time}',
                style: TextStyle(fontSize: 16)),
            Text('Date: ${exchangeBookingItem.date}',
                style: TextStyle(fontSize: 16)),
            Text('Payment: ${exchangeBookingItem.payment}',
                style: TextStyle(fontSize: 16)),
            Text('Delivery Boy: ${exchangeBookingItem.deliveryBoy}',
                style: TextStyle(fontSize: 16)),
            Text('Status: ${exchangeBookingItem.status}',
                style: TextStyle(fontSize: 16)),
            Text('Is Active: ${exchangeBookingItem.isActive}',
                style: TextStyle(fontSize: 16)),
            Text('Price: ${exchangeBookingItem.price}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem cartItem) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name: ${cartItem.productName}',
                style: TextStyle(fontSize: 16)),
            Text('Smart Device Included: ${cartItem.smartDeviceIncluded}',
                style: TextStyle(fontSize: 16)),
            Text('Size: ${cartItem.size}', style: TextStyle(fontSize: 16)),
            Text('Color: ${cartItem.color}', style: TextStyle(fontSize: 16)),
            Text('Time: ${cartItem.time}', style: TextStyle(fontSize: 16)),
            Text('Date: ${cartItem.date}', style: TextStyle(fontSize: 16)),
            Text('Payment: ${cartItem.payment}',
                style: TextStyle(fontSize: 16)),
            Text('Delivery Boy: ${cartItem.deliveryBoy}',
                style: TextStyle(fontSize: 16)),
            Text('Status: ${cartItem.status}', style: TextStyle(fontSize: 16)),
            Text('Is Active: ${cartItem.isActive}',
                style: TextStyle(fontSize: 16)),
            Text('Price: ${cartItem.price}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Future<void> addCartItemToFirestore(CartItem cartItem) async {
    try {
      var fireUser = FirebaseAuth.instance.currentUser!;
      var bookingId = FirebaseFirestore.instance
          .collection('Users')
          .doc(fireUser.uid)
          .collection('Bookings')
          .doc()
          .id;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(fireUser.uid)
          .collection('Bookings')
          .doc(bookingId)
          .set({
        'Smart device Included': cartItem.smartDeviceIncluded,
        'Size': cartItem.size,
        'Color': cartItem.color,
        'Time': cartItem.time,
        'Date': cartItem.date,
        'Payment': cartItem.payment,
        'Delivery boy': cartItem.deliveryBoy,
        'Status': cartItem.status,
        'price': cartItem.price,
        'isActive': cartItem.isActive,
      });
    } catch (e) {
      print('Error adding item to cart: $e');
    }
  }

  Future<void> addExchangeBookingToFirestore(
      ExchangeBookingItem exchangeBookingItem) async {
    try {
      var fireUser = FirebaseAuth.instance.currentUser!;
      var bookingId = FirebaseFirestore.instance
          .collection('Users')
          .doc(fireUser.uid)
          .collection('ExchangeBookings')
          .doc()
          .id;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(fireUser.uid)
          .collection('ExchangeBookings')
          .doc(bookingId)
          .set({
      //  'id': exchangeBookingItem.id,
        'size': exchangeBookingItem.size,
        'color': exchangeBookingItem.color,
        'time': exchangeBookingItem.time,
        'date': exchangeBookingItem.date,
        'payment': exchangeBookingItem.payment,
        'deliveryBoy': exchangeBookingItem.deliveryBoy,
        'status': exchangeBookingItem.status,
        'isActive': exchangeBookingItem.isActive,
        'price': exchangeBookingItem.price,
      });
    } catch (e) {
      print('Error adding exchange booking to Firestore: $e');
    }
  }
}
