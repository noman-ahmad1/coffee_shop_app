import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      initialChildSize: 0.4, // Starting height
      minChildSize: 0.14, // Minimum height when collapsed
      maxChildSize: 0.4, // Maximum height when expanded
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController, // Attach the scroll controller
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenSize.height * 0.4,
              width: screenSize.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Container(
                    height: screenSize.height * 0.005,
                    width: screenSize.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kcVeryLightGrey,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Text(
                    request.title!,
                    style: const TextStyle(
                        color: kcBlackColor,
                        fontSize: 18,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w900),
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Delivery to',
                        style: TextStyle(
                            color: kcLightGrey,
                            fontSize: 13,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.01,
                      ),
                      Text(
                        request.description!,
                        style: const TextStyle(
                            color: kcBlackColor,
                            fontSize: 15,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w900),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.019,
                  ),
                  const StepProgressIndicator(
                    totalSteps: 4,
                    currentStep: 3,
                    selectedColor: kcLightCoffeeColor,
                    unselectedColor: kcVeryLightGrey,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Container(
                    height: screenSize.height * 0.09,
                    width: screenSize.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: kcLightGrey,
                        ),
                        color: Colors.white),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.028,
                        ),
                        Container(
                          height: screenSize.height * 0.065,
                          width: screenSize.width * 0.16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: kcLightGrey,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Image.asset(
                              color: kcLightCoffeeColor,
                              myIcons.bike,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.height * 0.009,
                            ),
                            const Text(
                              'Delivered your order',
                              style: TextStyle(
                                  color: kcBlackColor,
                                  fontSize: 15,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              'We will deliver your goods to you in\n the shortest possible time',
                              style: TextStyle(
                                  color: kcLightGrey,
                                  fontSize: 12,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            fit: BoxFit.cover,
                            height: screenSize.height * 0.075,
                            width: screenSize.width * 0.18,
                            'assets/profilepic.jpg'),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.06,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Simon Doul',
                            style: TextStyle(
                                color: kcBlackColor,
                                fontSize: 15,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.003,
                          ),
                          const Text(
                            'Personal Courier',
                            style: TextStyle(
                                color: kcLightGrey,
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width * 0.22,
                      ),
                      Container(
                        height: screenSize.height * 0.056,
                        width: screenSize.width * 0.125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: kcLightGrey,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            color: kcBlackColor,
                            myIcons.call,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
