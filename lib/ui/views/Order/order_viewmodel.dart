import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  GoogleMapController? mapController;

  final LatLng center = const LatLng(37.7749, -122.4194);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    notifyListeners();
  }

  final CartService _cartService = locator<CartService>();
  List<CoffeeFlavor> get cartItems => _cartService.cartItems;
  int get totalItemCount => _cartService.totalItemCount;
  int get cartItemCount => _cartService.cartItemCount;
  double get totalPrice => _cartService.totalPrice;
  double get deliveryFee => _cartService.deliveryFee;
  double get overAllPrice => _cartService.overAllPrice;

  void init() {
    _cartService.addListener(notifyListeners);
  }

  navigateToCart(BuildContext context) {
    _navigationService.navigateToCartView(onNavigateToProducts: () {});
  }

  navigateToMap() {
    _navigationService.navigateToMapView();
  }

  void navigateToCartView(BuildContext context, selectedflavor) {}
}
