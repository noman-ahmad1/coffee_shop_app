import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'phoneauth_viewmodel.dart';

class PhoneauthView extends StackedView<PhoneauthViewModel> {
  const PhoneauthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PhoneauthViewModel viewModel,
    Widget? child,
  ) {
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _otpController = TextEditingController();
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kcBackgroundColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.2),
              const Center(
                child: Text(
                  "Verify phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: kcLightCoffeeColor,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              const Text(
                'Life happens, coffee helps. ☕\n Enter your number and join us!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sora',
                  color: kcDarkGreyColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: screenSize.height * 0.05),

              // Display error message
              if (viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              SizedBox(height: screenSize.height * 0.02),

              // Phone Number Input
              Container(
                width: screenSize.width * 0.9,
                child: TextField(
                  onChanged: (value) => viewModel.phoneNumber = value,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.phone, color: kcLightGrey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    hintText: 'Enter Phone Number',
                    hintStyle: const TextStyle(
                      color: kcLightGrey,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenSize.height * 0.02),

              // Request OTP Button
              GestureDetector(
                onTap: () {
                  viewModel.printFCMToken();
                  viewModel.signInWithPhoneNumber(viewModel.phoneNumber);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: kcLightCoffeeColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  height: screenSize.height * 0.07,
                  width: screenSize.width * 0.9,
                  child: const Center(
                    child: Text(
                      'Send OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sora',
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenSize.height * 0.02),

              // OTP Input Field (only shown after OTP is sent)
              if (viewModel.verificationId.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: screenSize.width * 0.9,
                      child: TextField(
                        onChanged: (value) => viewModel.smsCode = value,
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontFamily: 'Sora',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon:
                              const Icon(Icons.lock, color: kcLightGrey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          hintText: 'Enter OTP',
                          hintStyle: const TextStyle(
                            color: kcLightGrey,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),

                    // Verify OTP Button
                    GestureDetector(
                      onTap: () {
                        viewModel.verifyOTP(viewModel.smsCode);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: kcLightCoffeeColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        height: screenSize.height * 0.07,
                        width: screenSize.width * 0.9,
                        child: const Center(
                          child: Text(
                            'Verify OTP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Sora',
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PhoneauthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PhoneauthViewModel();
}
