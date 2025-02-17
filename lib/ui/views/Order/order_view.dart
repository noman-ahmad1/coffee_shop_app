import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/widgets/top_bar.dart';
import 'package:stacked/stacked.dart';
import 'order_viewmodel.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class OrderView extends StackedView<OrderViewModel> {
  const OrderView({super.key});

  @override
  void onViewModelReady(OrderViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
    BuildContext context,
    OrderViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcBackgroundColor2,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
            child: Column(children: [
              TopBar(
                title: 'Order',
                icon: myIcons.cart_outlined,
                onIconPressed: () {
                  viewModel.navigateToCart(context);
                },
                onBackButtonPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Container(
                height: screenSize.height * 0.66,
                width: screenSize.width,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        height: screenSize.height * 0.063,
                        width: screenSize.width * 0.46,
                        // decoration: BoxDecoration(
                        // ),
                        backgroundColor: kcLightCoffeeColor,
                        unselectedBackgroundColor: kcVeryLightGrey,
                        unselectedLabelStyle:
                            const TextStyle(color: kcLightCoffeeColor),
                        labelStyle: const TextStyle(color: Colors.white),
                        tabs: [
                          Tab(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenSize.width * 0.14,
                                ),
                                const Text(
                                  'Deliver',
                                  style: TextStyle(
                                      //color: kcVeryLightGrey,
                                      color: kcBlackColor,
                                      fontFamily: 'Sora',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenSize.width * 0.14,
                                ),
                                const Text(
                                  'Pick Up',
                                  style: TextStyle(
                                      //color: kcVeryLightGrey,
                                      color: kcBlackColor,
                                      fontFamily: 'Sora',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: kcBackgroundColor2),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: screenSize.height * 0.011,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: kcVeryLightGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            height: screenSize.height * 0.27,
                                            width: screenSize.width * 0.9,
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: kcVeryLightGrey,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                  ),
                                                  height:
                                                      screenSize.height * 0.06,
                                                  width: screenSize.width * 0.9,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Delivery Address',
                                                          style: TextStyle(
                                                              color:
                                                                  kcBlackColor,
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  'Sora',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                        Image.asset(
                                                          myIcons.edit,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height:
                                                //       screenSize.height * 0.02,
                                                // ),
                                                Container(
                                                  height:
                                                      screenSize.height * 0.191,
                                                  width:
                                                      screenSize.width * 0.825,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: GoogleMap(
                                                        onMapCreated: viewModel
                                                            .onMapCreated,
                                                        initialCameraPosition:
                                                            CameraPosition(
                                                          target:
                                                              viewModel.center,
                                                          zoom: 11.0,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.02,
                                          ),
                                          const Text(
                                            'Nawab Town, Lahore',
                                            style: TextStyle(
                                                color: kcBlackColor,
                                                fontSize: 13,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.005,
                                          ),
                                          const Text(
                                            '97 A, Chauhan Street, Nawab Town, Lahore',
                                            style: TextStyle(
                                                color: kcLightGrey,
                                                fontSize: 12,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w100),
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height:
                                                    screenSize.height * 0.038,
                                                width: screenSize.width * 0.36,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: kcLightGrey,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13, 7, 13, 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Image.asset(
                                                        myIcons.edit,
                                                        height:
                                                            screenSize.height *
                                                                0.02,
                                                        width:
                                                            screenSize.width *
                                                                0.05,
                                                      ),
                                                      const Text(
                                                        'Edit Address',
                                                        style: TextStyle(
                                                            color: kcBlackColor,
                                                            fontSize: 12,
                                                            fontFamily: 'Sora',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width * 0.03,
                                              ),
                                              Container(
                                                height:
                                                    screenSize.height * 0.038,
                                                width: screenSize.width * 0.305,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: kcLightGrey,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13, 7, 13, 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Image.asset(
                                                        myIcons.note,
                                                        height:
                                                            screenSize.height *
                                                                0.015,
                                                        width:
                                                            screenSize.width *
                                                                0.052,
                                                      ),
                                                      const Text(
                                                        'Add Note',
                                                        style: TextStyle(
                                                            color: kcBlackColor,
                                                            fontSize: 12,
                                                            fontFamily: 'Sora',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // spacedDivider,
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: kcVeryLightGrey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        height: screenSize.height * 0.2,
                                        width: screenSize.width * 0.9,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: kcVeryLightGrey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                              height: screenSize.height * 0.06,
                                              width: screenSize.width * 0.9,
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Payment Method',
                                                      style: TextStyle(
                                                          color: kcBlackColor,
                                                          fontSize: 17,
                                                          fontFamily: 'Sora',
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    Text(
                                                      'Change',
                                                      style: TextStyle(
                                                          color: kcBlackColor,
                                                          fontSize: 12,
                                                          fontFamily: 'Sora',
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        myIcons.cash,
                                                        height:
                                                            screenSize.height *
                                                                0.028,
                                                        width:
                                                            screenSize.width *
                                                                0.08,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenSize.width *
                                                                0.02,
                                                      ),
                                                      const Text(
                                                        'Cash',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'Sora',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Sora',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.02,
                                            ),
                                            spacedDivider,
                                            SizedBox(
                                              height: screenSize.height * 0.02,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        myIcons.card,
                                                        height:
                                                            screenSize.height *
                                                                0.028,
                                                        width:
                                                            screenSize.width *
                                                                0.08,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenSize.width *
                                                                0.02,
                                                      ),
                                                      const Text(
                                                        'Card',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: 'Sora',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Sora',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height:
                                            //       screenSize.height * 0.02,
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
                                      ),
                                      // spacedDivider,
                                      Container(
                                        height: screenSize.height * 0.07,
                                        width: screenSize.width * 0.9,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                              height: screenSize.height * 0.035,
                                              width: screenSize.width * 0.065,
                                              myIcons.percent,
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.065,
                                            ),
                                            const Text(
                                              '1 Discount is Applies',
                                              style: TextStyle(
                                                  color: kcBlackColor,
                                                  fontSize: 15,
                                                  fontFamily: 'Sora',
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.148,
                                            ),
                                            Image.asset(
                                              height: screenSize.height * 0.035,
                                              width: screenSize.width * 0.065,
                                              myIcons.next,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.02,
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
                                            height: screenSize.height * 0.02,
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$${viewModel.overAllPrice.toStringAsFixed(1)}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Sora',
                                                    fontWeight:
                                                        FontWeight.w900),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$${viewModel.deliveryFee.toStringAsFixed(1)}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Sora',
                                                    fontWeight:
                                                        FontWeight.w900),
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
                                                'Grand Total',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Sora',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Sora',
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.008,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: kcBackgroundColor2),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Pickup Address',
                                          style: TextStyle(
                                              color: kcBlackColor,
                                              fontSize: 17,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: screenSize.height * 0.02,
                                        ),
                                        const Text(
                                          'Tim Hortons, Lahore',
                                          style: TextStyle(
                                              color: kcBlackColor,
                                              fontSize: 13,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: screenSize.height * 0.005,
                                        ),
                                        const Text(
                                          '97 A, Main Boulevard, Gulberg 2, Lahore',
                                          style: TextStyle(
                                              color: kcLightGrey,
                                              fontSize: 12,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.w100),
                                        ),
                                        SizedBox(
                                          height: screenSize.height * 0.015,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: screenSize.height * 0.039,
                                              width: screenSize.width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: kcLightGrey,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        13, 7, 13, 7),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                      myIcons.edit,
                                                      height:
                                                          screenSize.height *
                                                              0.02,
                                                      width: screenSize.width *
                                                          0.05,
                                                    ),
                                                    const Text(
                                                      'Change Branch',
                                                      style: TextStyle(
                                                          color: kcBlackColor,
                                                          fontSize: 12,
                                                          fontFamily: 'Sora',
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenSize.width * 0.03,
                                            ),
                                            Container(
                                              height: screenSize.height * 0.039,
                                              width: screenSize.width * 0.305,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: kcLightGrey,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        13, 7, 13, 7),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                      myIcons.note,
                                                      height:
                                                          screenSize.height *
                                                              0.015,
                                                      width: screenSize.width *
                                                          0.052,
                                                    ),
                                                    const Text(
                                                      'Add Note',
                                                      style: TextStyle(
                                                          color: kcBlackColor,
                                                          fontSize: 12,
                                                          fontFamily: 'Sora',
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.02,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: kcVeryLightGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      height: screenSize.height * 0.2,
                                      width: screenSize.width * 0.9,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: kcVeryLightGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            height: screenSize.height * 0.06,
                                            width: screenSize.width * 0.9,
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Payment Method',
                                                    style: TextStyle(
                                                        color: kcBlackColor,
                                                        fontSize: 17,
                                                        fontFamily: 'Sora',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Change',
                                                    style: TextStyle(
                                                        color: kcBlackColor,
                                                        fontSize: 12,
                                                        fontFamily: 'Sora',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      myIcons.cash,
                                                      height:
                                                          screenSize.height *
                                                              0.028,
                                                      width: screenSize.width *
                                                          0.08,
                                                    ),
                                                    SizedBox(
                                                      width: screenSize.width *
                                                          0.02,
                                                    ),
                                                    const Text(
                                                      'Cash',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: 'Sora',
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Sora',
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.02,
                                          ),
                                          spacedDivider,
                                          SizedBox(
                                            height: screenSize.height * 0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      myIcons.card,
                                                      height:
                                                          screenSize.height *
                                                              0.028,
                                                      width: screenSize.width *
                                                          0.08,
                                                    ),
                                                    SizedBox(
                                                      width: screenSize.width *
                                                          0.02,
                                                    ),
                                                    const Text(
                                                      'Card',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: 'Sora',
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Sora',
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height:
                                          //       screenSize.height * 0.02,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.02,
                                    ),
                                    Container(
                                      height: screenSize.height * 0.07,
                                      width: screenSize.width * 0.9,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                            height: screenSize.height * 0.035,
                                            width: screenSize.width * 0.065,
                                            myIcons.percent,
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.065,
                                          ),
                                          const Text(
                                            '1 Discount is Applies',
                                            style: TextStyle(
                                                color: kcBlackColor,
                                                fontSize: 15,
                                                fontFamily: 'Sora',
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.148,
                                          ),
                                          Image.asset(
                                            height: screenSize.height * 0.035,
                                            width: screenSize.width * 0.065,
                                            myIcons.next,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.02,
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
                                          height: screenSize.height * 0.02,
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          // SizedBox(
          //   height: screenSize.height * 0.023,
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              height: screenSize.height * 0.209,
              width: screenSize.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          myIcons.wallet,
                          color: kcLightCoffeeColor,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cash/Wallet',
                              style: TextStyle(
                                  color: kcBlackColor,
                                  fontSize: 17,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.002,
                            ),
                            Text(
                              "\$${viewModel.totalPrice.toStringAsFixed(1)}",
                              style: const TextStyle(
                                  color: kcLightCoffeeColor,
                                  fontSize: 14,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: screenSize.width * 0.4,
                        ),
                        Image.asset(
                          myIcons.down,
                          height: screenSize.height * 0.03,
                          width: screenSize.width * 0.08,
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        //viewModel.navigateToOrder();
                      },
                      child: GestureDetector(
                        onTap: () {
                          viewModel.confirmOrder();
                          viewModel.navigateToMap();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kcLightCoffeeColor,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          height: screenSize.height * 0.08,
                          width: screenSize.width * 0.9,
                          child: const Center(
                            child: Text(
                              'Place Order',
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
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  @override
  OrderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderViewModel();
}
