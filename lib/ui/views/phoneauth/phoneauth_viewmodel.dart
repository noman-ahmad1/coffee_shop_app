import 'package:flutter/material.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/ui/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PhoneauthViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  String phoneNumber = '';
  String verificationId = '';
  String smsCode = '';
  String? errorMessage; // Error message for UI feedback

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    setBusy(true);
    try {
      await _authenticationService.signInWithPhoneNumber(
        phoneNumber,
        (String verificationId) {
          this.verificationId =
              verificationId; // Store the received verificationId
          notifyListeners();
        },
      );
      errorMessage = null;
    } catch (e) {
      errorMessage = "Failed to send OTP. Please try again.";
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> verifyOTP(String smsCode) async {
    setBusy(true);
    try {
      final user =
          await _authenticationService.verifyOTP(verificationId, smsCode);
      if (user != null) {
        errorMessage = null;
        navigateToDashboard();
      } else {
        errorMessage = "Invalid OTP. Please try again.";
      }
    } catch (e) {
      errorMessage = "OTP verification failed. Please try again.";
    }
    setBusy(false);
    notifyListeners();
  }

  void navigateToDashboard() {
    _navigationService.navigateToDashboardView(
      test: true,
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
    );
  }
void printFCMToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token");
}

}
