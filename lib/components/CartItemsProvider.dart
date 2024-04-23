import 'package:flutter/material.dart';
import 'CartItems.dart';
import 'ExchangeBookingItem.dart'; // Import the ExchangeBookingItem class

class CartItemsProvider extends ChangeNotifier {
  List<CartItem> _cartItemsList = [];
  List<ExchangeBookingItem> _exchangeBookingItemsList = [];
  // Add a list for ExchangeBookingItem

  List<CartItem> get cartItemsList => _cartItemsList;
  List<ExchangeBookingItem> get exchangeBookingItemsList => _exchangeBookingItemsList; // Getter for ExchangeBookingItem list

  void addToCart(CartItem item) {
    _cartItemsList.add(item);
    notifyListeners();
  }

  void addToExchangeBooking(ExchangeBookingItem item) {
    // Add method to add ExchangeBookingItem
    _exchangeBookingItemsList.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItemsList.remove(item);
    notifyListeners();
  }

  void removeFromExchangeBooking(ExchangeBookingItem item) {
    // Add method to remove ExchangeBookingItem
    _exchangeBookingItemsList.remove(item);
    notifyListeners();
  }

  void updateCartItem(CartItem oldItem, CartItem newItem) {
    final index = _cartItemsList.indexOf(oldItem);
    if (index != -1) {
      _cartItemsList[index] = newItem;
      notifyListeners();
    }
  }

  void updateExchangeBookingItem(ExchangeBookingItem oldItem, ExchangeBookingItem newItem) {
    // Add method to update ExchangeBookingItem
    final index = _exchangeBookingItemsList.indexOf(oldItem);
    if (index != -1) {
      _exchangeBookingItemsList[index] = newItem;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItemsList.clear();
    notifyListeners();
  }

  void clearExchangeBookingItems() {
    // Add method to clear ExchangeBookingItem list
    _exchangeBookingItemsList.clear();
    notifyListeners();
  }
}
