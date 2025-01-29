import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/views/detail/detail_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';

class CustomButton extends ViewModelWidget<DetailViewModel> {
  final Color borderColor;
  final Color buttonColor;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.borderColor,
    required this.buttonColor,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    DetailViewModel viewModel,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.0582,
      width: screenSize.width * 0.282,
      margin: const EdgeInsets.symmetric(
          vertical: 15), // Add vertical margin between buttons
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: buttonColor, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: borderColor, // Border color
              width: 1.5, // Border width
            ),
          ),
          //padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Padding inside the button
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Sora',
              fontWeight: FontWeight.w500,
              color: kcBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}
