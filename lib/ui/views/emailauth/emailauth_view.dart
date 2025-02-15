import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcBackgroundColor2,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.2,
          ),
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
          SizedBox(
            height: screenSize.height * 0.02,
          ),
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
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Container(
            width: screenSize.width*0.9,
            child: TextField(
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
    prefixIcon: const Icon(Icons.email_outlined, color: kcLightGrey),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: kcLightGrey.withOpacity(0.4), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.redAccent, width: 2),
    ),
    // Adding a soft shadow for a modern feel
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
),

          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Container(
            width: screenSize.width*0.9,
            child: TextField(
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
    prefixIcon: const Icon(Icons.password_outlined, color: kcLightGrey),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: kcLightGrey.withOpacity(0.4), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.redAccent, width: 2),
    ),
    // Adding a soft shadow for a modern feel
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
),

          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              viewModel.navigateToDashboard();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: kcLightCoffeeColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: screenSize.height*0.07,
              width: screenSize.width*0.9,
              child: const Padding(
                padding: EdgeInsets.only(top: 19),
                child: Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Sora',
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  @override
  EmailauthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EmailauthViewModel();
}
