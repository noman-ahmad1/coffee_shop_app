import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onBackButtonPressed;
  final VoidCallback? onIconPressed;

  TopBar({
    required this.title,
    required this.icon,
    required this.onBackButtonPressed,
    this.onIconPressed,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: onBackButtonPressed,
        child: Container(
          child: Image.asset(
            myIcons.back,
            height: screenSize.height * 0.033,
            width: screenSize.width * 0.13,
          ),
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w900,
        ),
      ),
      GestureDetector(
        onTap: () {
          onIconPressed;
        },
        child: Image.asset(
          icon,
          height: screenSize.height * 0.033,
          width: screenSize.width * 0.13,
        ),
      )
    ]);
  }
}
