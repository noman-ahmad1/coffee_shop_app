import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:stacked/stacked.dart';

class CartService with ListenableServiceMixin {
  List<CoffeeFlavor> cartItems = [];
  late final Box cartBox;
  double overAllPrice = 0.0;
  double totalPrice = 0.0;
  double deliveryFee = 0.2;

  CartService() {
    listenToReactiveValues(cartItems);
    _initializeCart();
  }

  Future<void> _initializeCart() async {
    if (!Hive.isBoxOpen('cart')) {
      await Hive.openBox('cart');
    }
    cartBox = Hive.box('cart');

    // Ensure unique items in cart when loading from Hive
    cartItems = List<CoffeeFlavor>.from(cartBox.get("itemslist") ?? []);
    _sanitizeCartItems();
    calculateTotalPrice();
  }

  // Ensures unique items in the cart
  void _sanitizeCartItems() {
    final uniqueItems = <String, CoffeeFlavor>{};

    for (var item in cartItems) {
      if (uniqueItems.containsKey(item.name)) {
        // Combine quantities for duplicate items
        uniqueItems[item.name]!.quantity += item.quantity;
      } else {
        uniqueItems[item.name] = item;
      }
    }

    cartItems = uniqueItems.values.toList();
    cartBox.put("itemslist", cartItems); // Save the sanitized list to Hive
  }

  int get totalItemCount {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  int get cartItemCount {
    return cartItems.length;
  }

  void addItemToCart(CoffeeFlavor item) async {
    // Check if item already exists in the cart
    final existingItem = cartItems.firstWhere(
      (element) => element.name == item.name,
      orElse: () => CoffeeFlavor(
          name: '', price: '', description: '', quantity: 0, imageAsset: '', id: ''),
    );

    if (existingItem.name.isNotEmpty) {
      // Update quantity if item already exists
      existingItem.quantity += 1;
    } else {
      // Add new item to the cart
      item.quantity = 1;
      cartItems.add(item);
    }

    // Recalculate and save changes
    calculateTotalPrice();
    cartBox.put("itemslist", cartItems); // Save to Hive
    notifyListeners(); // Notify listeners to update UI
  }

  void removeItem(CoffeeFlavor item) async {
    // Check if item exists in the cart
    final existingItem = cartItems.firstWhere(
      (element) => element.name == item.name,
      orElse: () => CoffeeFlavor(
          name: '', price: '', description: '', quantity: 0, imageAsset: '', id: ''),
    );

    if (existingItem.name.isNotEmpty) {
      if (existingItem.quantity > 1) {
        // Decrease quantity if greater than 1
        existingItem.quantity -= 1;
      } else {
        // Remove item if quantity becomes 0
        cartItems.remove(existingItem);
      }
    }

    // Recalculate and save changes
    calculateTotalPrice();
    cartBox.put("itemslist", cartItems); // Save updated list to Hive
    notifyListeners(); // Notify listeners to update UI
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    overAllPrice = 0;

    for (var item in cartItems) {
      overAllPrice += double.parse(item.price) * item.quantity;
    }

    totalPrice = overAllPrice + deliveryFee;
  }

  void clearCart() {
    cartItems.clear();
    cartBox.clear();
    notifyListeners();
  }
}
