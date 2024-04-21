import 'package:flutter/material.dart';
import 'CartItems.dart';

class CartItemsProvider extends ChangeNotifier {
  List<CartItem> _cartItemsList = [];

  List<CartItem> get cartItemsList => _cartItemsList;

  void addToCart(CartItem item) {
    _cartItemsList.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItemsList.remove(item);
    notifyListeners();
  }

  void updateCartItem(CartItem oldItem, CartItem newItem) {
    final index = _cartItemsList.indexOf(oldItem);
    if (index != -1) {
      _cartItemsList[index] = newItem;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItemsList.clear();
    notifyListeners();
  }
}
