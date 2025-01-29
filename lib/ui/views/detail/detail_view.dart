import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/views/dashboard/button_bar.dart';
import 'package:my_first_app/ui/widgets/top_bar.dart';
import 'package:stacked/stacked.dart';
import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  final CoffeeFlavor flavor;
  const DetailView({super.key, required this.flavor});

  @override
  Widget builder(
    BuildContext context,
    DetailViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcBackgroundColor2,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
              //padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(
                      title: 'Detail',
                      icon: myIcons.favourite_outlined,
                      onIconPressed: () {
                        print('hello');
                      },
                      onBackButtonPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: screenSize.height * 0.035,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(flavor.imageAsset),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            flavor.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w900),
                          ),
                          const Text(
                            'Ice/Hot',
                            style: TextStyle(
                                color: kcLightGrey,
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w100),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                myIcons.star,
                                height: screenSize.height * 0.07,
                                width: screenSize.width * 0.07,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.016,
                              ),
                              const Text(
                                '4.8',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              const Text(
                                '(230)',
                                style: TextStyle(
                                    color: kcLightGrey,
                                    fontSize: 12,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: kcVeryLightGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            height: screenSize.height * 0.055,
                            width: screenSize.width * 0.115,
                            child: Center(
                              child: Image.asset(
                                myIcons.bike,
                                color: kcLightCoffeeColor,
                                height: screenSize.height * 0.03,
                                width: screenSize.width * 0.07,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kcVeryLightGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            height: screenSize.height * 0.055,
                            width: screenSize.width * 0.115,
                            child: Center(
                              child: Image.asset(
                                myIcons.bean,
                                color: kcLightCoffeeColor,
                                height: screenSize.height * 0.03,
                                width: screenSize.width * 0.07,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kcVeryLightGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            height: screenSize.height * 0.055,
                            width: screenSize.width * 0.115,
                            child: Center(
                              child: Image.asset(
                                myIcons.milk,
                                color: kcLightCoffeeColor,
                                height: screenSize.height * 0.03,
                                width: screenSize.width * 0.07,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  spacedDivider,
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.009,
                      ),
                      Text(
                        flavor.description,
                        style: const TextStyle(
                            color: kcLightGrey,
                            fontSize: 12,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      const Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) {
                          return CustomButton(
                            borderColor:
                                viewModel.buttonStates[index].borderColor,
                            buttonColor:
                                viewModel.buttonStates[index].buttonColor,
                            text: ['S', 'M', 'L'][index],
                            onPressed: () {
                              viewModel.toggleButtonColor(index);
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  // You can choose different transitions like FadeTransition, ScaleTransition, etc.
                  return FadeTransition(opacity: animation, child: child);
                },
                child: viewModel.isLargeButton
                    ? Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 18),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                viewModel.navigateToCart(context, flavor);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kcLightCoffeeColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.89,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          //           SizedBox(
                                          //   width: screenSize.width * 0.03,
                                          // ),
                                          Container(
                                            height: screenSize.height * 0.04,
                                            width: screenSize.width * 0.09,
                                            decoration: BoxDecoration(
                                              color: kcLightCoffeeColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                width: 1.5,
                                                color: kcVeryLightCoffeeColor,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  style: TextStyle(
                                                      color: kcVeryWhiteColor),
                                                  '1'),
                                            ),
                                          ),
                                          //                 SizedBox(
                                          //   width: screenSize.width * 0.03,
                                          // ),
                                          Text(
                                            'View Your Cart',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Sora',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            flavor.price,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Price',
                                        style: TextStyle(
                                            color: kcLightGrey,
                                            fontSize: 17,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w100),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.005,
                                      ),
                                      Text(
                                        flavor.price,
                                        style: TextStyle(
                                            color: kcLightCoffeeColor,
                                            fontSize: 19,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.toggleButtonState();
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: kcLightCoffeeColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      height: screenSize.height * 0.08,
                                      width: screenSize.width * 0.57,
                                      child: const Center(
                                        child: Text(
                                          'Add to Cart',
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
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailViewModel();
}
