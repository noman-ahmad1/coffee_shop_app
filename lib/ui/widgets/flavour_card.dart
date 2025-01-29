import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/views/dashboard/detail.dart';

class FlavourCard extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final String price;
  final String buttonIconPath;
  final String favButton;
  final String imageAsset;
  final VoidCallback onTap;
  final VoidCallback onButtonPressed;
  final VoidCallback onFavPressed;

  const FlavourCard({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.price,
    required this.buttonIconPath,
    required this.favButton,
    required this.imageAsset,
    required this.onTap,
    required this.onButtonPressed,
    required this.onFavPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        //margin: const EdgeInsets.fromLTRB(25,25,0,10),
        height: screenSize.height * 0.310,
        width: screenSize.width * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: color,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 7, 7, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Stack(
                  children: [
                    Image.asset(imageAsset,
                        height: screenSize.height * 0.155,
                        width: screenSize.width * 0.8,
                        fit: BoxFit.cover),
                        GestureDetector(
                        onTap: onFavPressed,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          height: screenSize.height * 0.038,
                          width: screenSize.width * 0.09,
                          child: Center(
                            child: Image.asset(
                              favButton,
                              color: Colors.white,
                              height: screenSize.height * 0.027,
                              width: screenSize.width * 0.07,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: kcLightGrey,
                      fontSize: 11,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      GestureDetector(
                        onTap: onButtonPressed,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: kcLightCoffeeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          height: screenSize.height * 0.056,
                          width: screenSize.width * 0.125,
                          child: Center(
                            child: Image.asset(
                              buttonIconPath,
                              color: kcVeryLightGrey,
                              height: screenSize.height * 0.030,
                              width: screenSize.width * 0.070,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
