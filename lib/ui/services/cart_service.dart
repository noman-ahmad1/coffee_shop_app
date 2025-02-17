import 'package:cloud_firestore/cloud_firestore.dart';
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = "user123"; // Replace with actual user ID from auth

  CartService() {
    listenToReactiveValues(cartItems);
    _initializeCart();
  }

  Future<void> _initializeCart() async {
    if (!Hive.isBoxOpen('cart')) {
      await Hive.openBox('cart');
    }
    cartBox = Hive.box('cart');

    // Load cart from Firestore
    await _loadCartFromFirestore();
  }

  Future<void> _loadCartFromFirestore() async {
    final cartSnapshot = await _firestore.collection('users').doc(userId).collection('cart').get();

    cartItems = cartSnapshot.docs.map((doc) {
      final data = doc.data();
      return CoffeeFlavor(
        id: doc.id, // Firestore doc ID
        name: data['name'],
        description: data['description'],
        imageAsset: data['imageAsset'],
        price: data['price'],
        quantity: data['quantity'],
      );
    }).toList();

    cartBox.put("itemslist", cartItems); // Save locally
    calculateTotalPrice();
    notifyListeners();
  }

  void addItemToCart(CoffeeFlavor item) async {
    final existingItemIndex = cartItems.indexWhere((element) => element.id == item.id);

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += 1;
    } else {
      item.quantity = 1;
      cartItems.add(item);
    }

    await _updateCartInFirestore();
    calculateTotalPrice();
    notifyListeners();
  }

  void removeItem(CoffeeFlavor item) async {
    final existingItemIndex = cartItems.indexWhere((element) => element.id == item.id);

    if (existingItemIndex != -1) {
      if (cartItems[existingItemIndex].quantity > 1) {
        cartItems[existingItemIndex].quantity -= 1;
      } else {
        cartItems.removeAt(existingItemIndex);
      }
    }

    await _updateCartInFirestore();
    calculateTotalPrice();
    notifyListeners();
  }

  void clearCart() async {
    cartItems.clear();
    await _firestore.collection('users').doc(userId).collection('cart').get().then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    cartBox.clear();
    notifyListeners();
  }

  Future<void> _updateCartInFirestore() async {
    final cartRef = _firestore.collection('users').doc(userId).collection('cart');

    for (var item in cartItems) {
      await cartRef.doc(item.id).set({
        'name': item.name,
        'description': item.description,
        'imageAsset': item.imageAsset,
        'price': item.price,
        'quantity': item.quantity,
      });
    }

    cartBox.put("itemslist", cartItems); // Sync with local storage
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    overAllPrice = 0;

    for (var item in cartItems) {
      overAllPrice += double.parse(item.price) * item.quantity;
    }

    totalPrice = overAllPrice + deliveryFee;
  }
  int get totalItemCount {
  return cartItems.fold(0, (sum, item) => sum + (item.quantity ?? 0));
}
int get cartItemCount {
  return cartItems.length;
}

}
