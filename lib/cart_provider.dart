import 'package:flutter/material.dart';

class CartItem {
  String name;
  double price;
  int quantity;
  String image;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> cartItems = [];

  // Method to add item to cart
  void addToCart(CartItem item) {
    cartItems.add(item);
    notifyListeners();
  }

  // Method to clear the cart
  void clearCart() {
    cartItems.clear(); // Clears all items in the cart
    notifyListeners(); // Notify listeners to update UI
  }
}
