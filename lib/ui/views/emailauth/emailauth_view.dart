import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'emailauth_viewmodel.dart';

class EmailauthView extends StackedView<EmailauthViewModel> {
  const EmailauthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EmailauthViewModel viewModel,
    Widget? child,
  ) {
    final TextEditingController _emailauthController = TextEditingController();
    final TextEditingController _passwordauthController =
        TextEditingController();
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kcBackgroundColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.2),
              Center(
                child: Text(
                  "Welcome back!\nLet's grab some coffee",
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
                'Enjoy the convenience of signing in\nwith your email.\nWe are available in all states.',
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
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
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

              // Email Field
              Container(
                width: screenSize.width * 0.9,
                child: TextField(
                  onChanged: (value) => viewModel.email = value,
                  controller: _emailauthController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: kcLightGrey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    hintText: 'Enter Email',
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

              // Password Field
              Container(
                width: screenSize.width * 0.9,
                child: TextField(
                  onChanged: (value) => viewModel.password = value,
                  controller: _passwordauthController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                        const Icon(Icons.password_outlined, color: kcLightGrey),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    hintText: 'Enter Password',
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
              SizedBox(height: screenSize.height * 0.05),

              // Sign In Button
              GestureDetector(
                onTap: () {
                  viewModel.signInWithEmail(
                      viewModel.email, viewModel.password);
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
                      'Sign In',
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

              // Sign Up Button (Properly Positioned)
              GestureDetector(
                onTap: () {
                  viewModel.navigateToSignUp();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: kcLightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  height: screenSize.height * 0.07,
                  width: screenSize.width * 0.9,
                  child: const Center(
                    child: Text(
                      'Sign Up',
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
        ),
      ),
    );
  }

  @override
  EmailauthViewModel viewModelBuilder(BuildContext context) =>
      EmailauthViewModel();
}
