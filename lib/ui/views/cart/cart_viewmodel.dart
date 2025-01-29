import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/services/cart_service.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends DashboardViewModel {
  int _counter = 1; // Counter for the view's item count
  int get counter => _counter;

  final _navigationService = locator<NavigationService>();
  final CartService _cartService = locator<CartService>();

  List<CoffeeFlavor> get cartItems => _cartService.cartItems;
  int get totalItemCount => _cartService.totalItemCount;
  double get totalPrice => _cartService.totalPrice;
  double get deliveryFee => _cartService.deliveryFee;
  double get overAllPrice => _cartService.overAllPrice;

  void addItemToCart(CoffeeFlavor item) {
    print('Adding item to cart: ${item.name}');
    _cartService.addItemToCart(item);
  }

  void removeItem(CoffeeFlavor item) {
    _cartService.removeItem(item);
  }

  void calculateTotalPrice() {
    _cartService.calculateTotalPrice();
  }

  void clearCart() {
    _cartService.clearCart();
  }

  void init() {
    _cartService.addListener(notifyListeners);
  }
//     List<CoffeeFlavor> cartItems = [];
//     late final Box cartBox;
//     double overAllPrice = 0.0;
//     double totalPrice = 0.0;
//     double deliveryFee = 0.2;
//     int get totalItemCount {
//     int totalCount = 0;
//     cartItems.forEach((item) {
//       totalCount += item.quantity;
//     });
//     return totalCount;
//   }
//     init() {
//     cartBox = Hive.box('cart');
//     cartItems = cartBox.get("itemslist") ?? [];
//     calculateTotalPrice();
//   }
//     void addItemToCart(CoffeeFlavor item) async {
//     if (cartItems.contains(item)) {
//       CoffeeFlavor currentItem =
//           cartItems.firstWhere((element) => element.name == item.name);
//       currentItem.quantity += 1;
//       for (var ele in cartItems) {
//         if (ele.name == currentItem.name) {
//           ele.quantity = currentItem.quantity;
//         }
//       }
//     } else {
//       item.quantity = 1;
//       cartItems.add(item);
//     }
//     calculateTotalPrice();
//     cartBox.put("itemslist", cartItems); // Save to Hive
//     notifyListeners(); // Update UI
//   }

//   // Method to remove an item from the cart
//   void removeItem(CoffeeFlavor item) async {
//   if (cartItems.contains(item)) {
//     CoffeeFlavor currentItem =
//         cartItems.firstWhere((element) => element.name == item.name);

//     if (currentItem.quantity > 1) {
//       // Decrease quantity if greater than 1
//       currentItem.quantity -= 1;
//     } else {
//       // Remove item if quantity becomes 0
//       cartItems.removeWhere((element) => element.name == currentItem.name);
//     }
//   }
//   calculateTotalPrice();
//   cartBox.put("itemslist", cartItems); // Save updated list
//   notifyListeners(); // Update UI
// }

// void calculateTotalPrice(){
//   totalPrice = 0;
//   overAllPrice = 0;
//     cartItems.forEach((item){
//       overAllPrice += double.parse(item.price) * item.quantity;
//     });
//     totalPrice = overAllPrice + deliveryFee;
// }
//   void clearCart() {
//     cartBox.clear();
//     notifyListeners();
//   }

  // navigateToDashboard(BuildContext context) {
  //   _navigationService.navigateToDashboardView();
  // }

  // Navigate to the Order view
  navigateToOrder(BuildContext context) {
    _navigationService.navigateToOrderView();
  }
}
