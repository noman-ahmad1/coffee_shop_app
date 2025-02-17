import 'package:flutter/material.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToDashboard() {
    _navigationService.navigateToDashboardView(
        test: true,
        key: Key(
          DateTime.now().microsecondsSinceEpoch.toString(),
        ));
  }

  navigateToEmailauth() {
    _navigationService.navigateToEmailauthView();
  }

  navigateToPhoneauth() {
    _navigationService.navigateToPhoneauthView();
  }
}
