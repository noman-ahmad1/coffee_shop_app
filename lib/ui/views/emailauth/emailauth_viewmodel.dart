import 'package:flutter/material.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/services/authentication_service.dart';
import 'package:my_first_app/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailauthViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  String? _verificationId;
  String? get verificationId => _verificationId;

  String _email = '';
  String _password = '';

  // Setters for email and password
  set email(String value) => _email = value;
  set password(String value) => _password = value;

  // Getters for email and password (optional)
  String get email => _email;
  String get password => _password;
  String? errorMessage;

  Future<void> signInWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      errorMessage = "Email and password cannot be empty.";
      notifyListeners();
      return;
    }

    if (!email.contains('@')) {
      errorMessage = "Please enter a valid email address.";
      notifyListeners();
      return;
    }

    if (password.length < 6) {
      errorMessage = "Password must be at least 6 characters long.";
      notifyListeners();
      return;
    }
    setBusy(true);
    final user =
        await _authenticationService.signInWithEmail(_email, _password);
    setBusy(false);
    if (user != null) {
      errorMessage = null;
      // Navigate to the home screen
      navigateToDashboard();
    } else {
      errorMessage = "Signup failed. Please try again.";
    }
  }

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

  navigateToSignUp() {
    _navigationService.navigateToSignupView();
  }
}
