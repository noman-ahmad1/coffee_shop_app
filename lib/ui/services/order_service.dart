import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to save order to Firestore
  Future<void> placeOrder(List<CoffeeFlavor> cartItems, String userId) async {
    try {
      // Create a unique order ID
      String orderId = _firestore.collection('orders').doc().id;

      // Convert cart items to Firestore format
      List<Map<String, dynamic>> orderItems = cartItems.map((item) => item.toJson()).toList();

      await _firestore.collection('orders').doc(orderId).set({
        'orderId': orderId,
        'userId': userId,
        'items': orderItems,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'pending',
      });

      print("Order placed successfully!");
    } catch (e) {
      print("Error placing order: $e");
    }
  }
}
