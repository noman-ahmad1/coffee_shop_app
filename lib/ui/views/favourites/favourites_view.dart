import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/widgets/top_bar.dart';
import 'package:stacked/stacked.dart';
import 'favourites_viewmodel.dart';

class FavouritesView extends StackedView<FavouritesViewModel> {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavouritesViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                        title: 'Favorites',
                        icon: myIcons.cart,
                        onBackButtonPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    viewModel.favourites.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: screenSize.height * 0.46,
                                  child: Image.asset(
                                      fit: BoxFit.fill,
                                      'assets/no_favourites.png')),
                              const Text(
                                textAlign: TextAlign.center,
                                'Your Favorites list is feeling lonely.\nAdd some love!',
                                style: TextStyle(
                                  color: kcLightCoffeeColor,
                                  fontSize: 21,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Container(
                                height: screenSize.height * 0.05,
                                width: screenSize.width * 0.11,
                                child: Image.asset(
                                    fit: BoxFit.fill, myIcons.smiley),
                              ),
                            ],
                          )
                        : Expanded(
                            child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: viewModel.favourites.length,
                              itemBuilder: (context, index) {
                                final coffee = viewModel.favourites[index];
                                return Column(
                                  children: [
                                    Row(key: ValueKey(coffee), children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                            fit: BoxFit.cover,
                                            height: screenSize.height * 0.085,
                                            width: screenSize.width * 0.18,
                                            coffee.imageAsset),
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
                                              coffee.name,
                                              style: const TextStyle(
                                                  color: kcBlackColor,
                                                  fontSize: 15,
                                                  fontFamily: 'Sora',
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.005,
                                            ),
                                            Text(
                                              coffee.description,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: kcLightGrey,
                                                  fontSize: 12,
                                                  fontFamily: 'Sora',
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.height * 0.1,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          viewModel
                                              .removeFromFavourites(coffee);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          height: screenSize.height * 0.038,
                                          width: screenSize.width * 0.09,
                                          child: Center(
                                            child: Image.asset(
                                              myIcons.favourite_filled,
                                              color: kcLightCoffeeColor,
                                              height: screenSize.height * 0.027,
                                              width: screenSize.width * 0.07,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                );
                              },
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
                                'Add your Favourite Coffee',
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
  FavouritesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavouritesViewModel();
}
