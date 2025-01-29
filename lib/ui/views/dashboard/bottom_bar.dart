import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BottomBar extends ViewModelWidget<DashboardViewModel> {
  BottomBar({Key? key}) : super(key: key);
  late final CoffeeFlavor flavor;
  @override
  Widget build(
    BuildContext context,
    DashboardViewModel viewModel,
  ) {
    final screenSize = MediaQuery.of(context).size;
    // int cartItemCount = 0; // Get cart item count
    return Container(
      height: screenSize.height * 0.10,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 10,
        //     spreadRadius: 2,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              viewModel.setIndex(0);
              viewModel.changeHomeIcon();
            },
            child: Image.asset(
              viewModel.imageAsset1,
              color: kcLightCoffeeColor,
              height: screenSize.height * 0.030,
              width: screenSize.width * 0.070,
            ),
          ),
          GestureDetector(
            onTap: () {
              viewModel.setIndex(1);
              viewModel.changefavouriteIcon();
            },
            child: Image.asset(
              viewModel.imageAsset2,
              color: kcLightCoffeeColor,
              height: screenSize.height * 0.030,
              width: screenSize.width * 0.070,
            ),
          ),
          GestureDetector(
            onTap: () {
              viewModel.setIndex(2);
              viewModel.changeCartIcon();
              // viewModel.navigateToCart(context, flavor);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  viewModel.imageAsset3,
                  color: kcLightCoffeeColor,
                  height: screenSize.height * 0.030,
                  width: screenSize.width * 0.070,
                ),
                if (viewModel.totalItemCount >
                    0) // Only show indicator if items exist
                  Positioned(
                    key: Key(viewModel.totalItemCount.toString()),
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: kcLightCoffeeColor,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Center(
                        child: Text(
                          '${viewModel.totalItemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              viewModel.setIndex(3);
              viewModel.changeBellIcon();
            },
            child: Image.asset(
              viewModel.imageAsset4,
              color: kcLightCoffeeColor,
              height: screenSize.height * 0.030,
              width: screenSize.width * 0.070,
            ),
          ),
        ],
      ),
    );
  }
}
