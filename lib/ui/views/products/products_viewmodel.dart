import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/services/cart_service.dart';
import 'package:my_first_app/ui/services/favourites_service.dart';
import 'package:my_first_app/ui/views/cart/cart_viewmodel.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/views/dashboard/detail.dart';
import 'package:my_first_app/ui/views/detail/detail_view.dart';
import 'package:my_first_app/ui/views/detail/detail_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_first_app/ui/views/dashboard/bottom_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductsViewModel extends DashboardViewModel {
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

  final FavouritesService _favouritesService = locator<FavouritesService>();
  List<CoffeeFlavor> get favourites => _favouritesService.favourites;
  // bool get isFavourite => _favouritesService.isFavourite(coffeeList as CoffeeFlavor);
  bool isFavourite(CoffeeFlavor coffeeList) {
    return _favouritesService.isFavourite(coffeeList);
  }

  void addToFavourites(CoffeeFlavor coffeeList) {
    _favouritesService.addToFavourites(coffeeList);
    print('item added to favourites');
  }

  void removeFromFavourites(CoffeeFlavor coffeeList) {
    _favouritesService.removeFromFavourites(coffeeList);
    print('item removed from favourites');
  }

  String _imageAsset1 = myIcons.home_outlined;
  String _imageAsset2 = myIcons.favourite_outlined;
  String _imageAsset3 = myIcons.cart_outlined;
  String _imageAsset4 = myIcons.bell_outlined;

  String get imageAsset1 => _imageAsset1;
  String get imageAsset2 => _imageAsset2;
  String get imageAsset3 => _imageAsset3;
  String get imageAsset4 => _imageAsset4;

  // List<CoffeeFlavor> cartItems = [];
  // late final Box cartBox;
  void resetIcons() {
    _imageAsset1 = myIcons.home_outlined;
    _imageAsset2 = myIcons.favourite_outlined;
    _imageAsset3 = myIcons.cart_outlined;
    _imageAsset4 = myIcons.bell_outlined;
  }

  List<Color> _buttonColors = List.generate(6, (_) => kcVeryLightGrey);
  List<Color> get buttonColors => _buttonColors;

  int _currentIndex = 0;

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  get currentIndex => _currentIndex;

  void changeColor(int index) {
    for (int i = 0; i < _buttonColors.length; i++) {
      if (i == index) {
        _buttonColors[i] = _buttonColors[i] == kcVeryLightGrey
            ? kcLightCoffeeColor
            : kcVeryLightGrey;
      } else {
        _buttonColors[i] = kcVeryLightGrey;
      }
    }
    notifyListeners(); // Notify listeners outside the loop
  }

  void changeHomeIcon() {
    resetIcons();
    if (_imageAsset1 == myIcons.home_outlined) {
      _imageAsset1 = myIcons.home_filled;
    } else {
      _imageAsset1 = myIcons.home_outlined;
    }
    notifyListeners();
  }

  void changefavouriteIcon() {
    resetIcons();
    if (_imageAsset2 == myIcons.favourite_outlined) {
      _imageAsset2 = myIcons.favourite_filled;
    } else {
      _imageAsset2 = myIcons.favourite_outlined;
    }
    notifyListeners();
  }

  void changeCartIcon() {
    resetIcons();
    if (_imageAsset3 == myIcons.cart_outlined) {
      _imageAsset3 = myIcons.cart_filled;
    } else {
      _imageAsset3 = myIcons.cart_outlined;
    }
    notifyListeners();
  }

  void changeBellIcon() {
    resetIcons();
    if (imageAsset4 == myIcons.bell_outlined) {
      _imageAsset4 = myIcons.bell_filled;
    } else {
      _imageAsset4 = myIcons.bell_outlined;
    }
    notifyListeners();
  }

  final _navigationService = locator<NavigationService>();
  navigateToCart(BuildContext context, CoffeeFlavor selectedflavor) {
    _navigationService.navigateToCartView(onNavigateToProducts: () {});
  }

  navigateToDetail(BuildContext context, CoffeeFlavor selectedFlavor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailView(flavor: selectedFlavor),
      ),
    );
  }
}
