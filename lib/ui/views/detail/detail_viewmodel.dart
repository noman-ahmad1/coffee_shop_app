import 'package:flutter/material.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/views/Order/order_view.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BaseViewModel {
  bool _isLargeButton = false;
  bool get isLargeButton => _isLargeButton;

  List<ButtonState> buttonStates = List.generate(
    3,
    (index) => ButtonState(
      borderColor: kcVeryLightGrey,
      buttonColor: Colors.white,
    ),
  );

  void toggleButtonColor(int pressedIndex) {
    for (int i = 0; i < buttonStates.length; i++) {
      buttonStates[i] = ButtonState(
        borderColor: kcVeryLightGrey,
        buttonColor: Colors.white,
      );

      buttonStates[pressedIndex] = ButtonState(
        borderColor: kcLightCoffeeColor,
        buttonColor: kcVeryLightCoffeeColor,
      );
      notifyListeners(); // Notify listeners of state change
    }
  }

  void toggleButtonState() {
    _isLargeButton = !_isLargeButton;
    notifyListeners(); // Notify the view to rebuild
  }

  final _navigationService = locator<NavigationService>();
  navigateToCart(BuildContext context, CoffeeFlavor selectedflavor) {
    _navigationService.navigateToCartView(onNavigateToProducts: () {});
  }

  navigateToOrder(BuildContext context, CoffeeFlavor selectedFlavor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderView(),
      ),
    );
  }
  //}
}

class ButtonState {
  final Color borderColor;
  final Color buttonColor;

  ButtonState({
    required this.borderColor,
    required this.buttonColor,
  });
}
