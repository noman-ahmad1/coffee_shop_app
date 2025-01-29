import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_view.dart';
import 'package:my_first_app/ui/views/products/products_view.dart';
import 'package:my_first_app/ui/widgets/top_bar.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:stacked/stacked.dart';
import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  final VoidCallback onNavigateToProducts;
  const CartView({super.key, required this.onNavigateToProducts});

  @override
  void onViewModelReady(CartViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return viewModel.totalItemCount == 0
        ? Scaffold(
            backgroundColor: kcBackgroundColor2,
            body: SafeArea(
              child: Container(
                height: screenSize.height*0.905,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopBar(
                              title: 'Cart',
                              icon: myIcons.cart,
                              onBackButtonPressed: () {
                                Navigator.pop(context);
                              }),
                              SizedBox(
                                height: screenSize.height*0.2,
                              ),
                        Container(
                          height: screenSize.height * 0.3,
                          child: Image.asset('assets/low_battery.png'),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Recharge in your happy place, one cup at a time.',
                          style: TextStyle(
                            color: kcLightCoffeeColor,
                            fontSize: 21,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kcBackgroundColor2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      height: screenSize.height * 0.15,
                      width: screenSize.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 18),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: kcLightCoffeeColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                height: screenSize.height * 0.07,
                                width: screenSize.width * 0.9,
                                child: const Center(
                                  child: Text(
                                    'Add your favorite pick-me-up to your cart.',
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
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: kcBackgroundColor2,
            body: SafeArea(
              child: Container(
                height: screenSize.height * 0.9,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                      child: Column(
                        children: [
                          TopBar(
                              title: 'Cart',
                              icon: myIcons.cart,
                              onBackButtonPressed: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Container(
                            width: screenSize.width,
                            child: SimpleAnimationProgressBar(
                              height: 30,
                              width: 300,
                              backgroundColor: kcVeryLightGrey,
                              foregrondColor: kcLightCoffeeColor,
                              ratio: 0.72,
                              direction: Axis.horizontal,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius: BorderRadius.circular(10),
                              gradientColor: const LinearGradient(colors: [
                                kcVeryLightCoffeeColor,
                                kcLightCoffeeColor
                              ]),
                              boxShadow: const [
                                BoxShadow(
                                  color: kcVeryLightCoffeeColor,
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Container(
                            height: screenSize.height * 0.1,
                            width: screenSize.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: kcLightGrey,
                                ),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenSize.width * 0.045,
                                ),
                                Image.asset(
                                  color: kcLightCoffeeColor,
                                  // height: screenSize.height * 0.035,
                                  // width: screenSize.width * 0.065,
                                  myIcons.bike,
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.06,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenSize.height * 0.023,
                                    ),
                                    const Text(
                                      'Estimated Delivery',
                                      style: TextStyle(
                                          color: kcBlackColor,
                                          fontSize: 15,
                                          fontFamily: 'Sora',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Text(
                                      'Time (15-30 mins)',
                                      style: TextStyle(
                                          color: kcBlackColor,
                                          fontSize: 17,
                                          fontFamily: 'Sora',
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          // spacedDivider,
                          // SizedBox(
                          //   height: screenSize.height * 0.02,
                          // ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: viewModel.cartItems.length,
                                    itemBuilder: (context, index) {
                                      final item = viewModel.cartItems[index];
                                      return Column(
                                        children: [
                                          Row(key: ValueKey(item), children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                  fit: BoxFit.cover,
                                                  height:
                                                      screenSize.height * 0.085,
                                                  width:
                                                      screenSize.width * 0.18,
                                                  item.imageAsset),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.04,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.name,
                                                    style: const TextStyle(
                                                        color: kcBlackColor,
                                                        fontSize: 15,
                                                        fontFamily: 'Sora',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  SizedBox(
                                                    height: screenSize.height *
                                                        0.005,
                                                  ),
                                                  Text(
                                                    item.description,
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: kcLightGrey,
                                                        fontSize: 12,
                                                        fontFamily: 'Sora',
                                                        fontWeight:
                                                            FontWeight.w100),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.05,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.removeItem(item);
                                                // if (item.quantity > 1) {
                                                //   viewModel.removeItem(item);
                                                // } else {

                                                // }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                    width: 1.5,
                                                    color:
                                                        kcVeryLightCoffeeColor,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    color: kcBlackColor,
                                                    height: screenSize.height *
                                                        0.017,
                                                    width: screenSize.width *
                                                        0.038,
                                                    item.quantity == 1
                                                        ? myIcons.delete
                                                        : myIcons.minus,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.04,
                                            ),
                                            Text(
                                              '${item.quantity}',
                                              style: const TextStyle(
                                                  color: kcBlackColor,
                                                  fontSize: 15,
                                                  fontFamily: 'Sora',
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.04,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.addItemToCart(item);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                    width: 1.5,
                                                    color:
                                                        kcVeryLightCoffeeColor,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                      height:
                                                          screenSize.height *
                                                              0.017,
                                                      width: screenSize.width *
                                                          0.038,
                                                      myIcons.plus),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.1,
                                            ),
                                          ]),
                                        ],
                                      );
                                    },
                                  ),
                                  // SizedBox(
                                  //   height: screenSize.height * 0.02,
                                  // ),
                                  // spacedDivider,
                                  SizedBox(
                                    height: screenSize.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: onNavigateToProducts,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                              width: 1.5,
                                              color: kcVeryLightCoffeeColor,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              child: Image.asset(
                                                  height:
                                                      screenSize.height * 0.017,
                                                  width:
                                                      screenSize.width * 0.038,
                                                  myIcons.plus),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenSize.width * 0.01,
                                      ),
                                      const Text(
                                        'Add more items',
                                        style: TextStyle(
                                            color: kcMediumGrey,
                                            fontSize: 15,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.01,
                                  ),
                                  spacedDivider,
                                  SizedBox(
                                    height: screenSize.height * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Payment Summary',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Price',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "\$${viewModel.overAllPrice.toStringAsFixed(1)}",
                                            // viewModel.overAllPrice.toStringAsFixed(1),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.008,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Delivery Fee',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "\$${viewModel.deliveryFee.toStringAsFixed(2)}",
                                            // viewModel.overAllPrice.toStringAsFixed(1),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.008,
                                      ),
                                      // const Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text(
                                      //       'Grand Total',
                                      //       style: TextStyle(
                                      //           fontSize: 15,
                                      //           fontFamily: 'Sora',
                                      //           fontWeight: FontWeight.w500),
                                      //     ),
                                      //     Text(
                                      //       '\$ 5.93',
                                      //       style: TextStyle(
                                      //           fontSize: 15,
                                      //           fontFamily: 'Sora',
                                      //           fontWeight: FontWeight.w900),
                                      //     ),
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: screenSize.height * 0.17,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: kcBackgroundColor2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        height: screenSize.height * 0.18,
                        width: screenSize.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          myIcons.bill,
                                          height: screenSize.height * 0.028,
                                          width: screenSize.width * 0.07,
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.01,
                                        ),
                                        const Text(
                                          'Total',
                                          style: TextStyle(
                                              color: kcBlackColor,
                                              fontSize: 17,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.01,
                                        ),
                                        const Text(
                                          '(Incl. fees and tax)',
                                          style: TextStyle(
                                              color: kcLightGrey,
                                              fontSize: 12,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: screenSize.width * 0.364,
                                  // ),
                                  Text(
                                    "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                                    style: const TextStyle(
                                        color: kcLightCoffeeColor,
                                        fontSize: 17,
                                        fontFamily: 'Sora',
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  viewModel.navigateToOrder(context);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: kcLightCoffeeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  height: screenSize.height * 0.07,
                                  width: screenSize.width * 0.9,
                                  child: const Center(
                                    child: Text(
                                      'Confirm payment and address',
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
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
