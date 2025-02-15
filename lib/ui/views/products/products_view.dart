import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/services/favourites_service.dart';
import 'package:my_first_app/ui/widgets/flavour_card.dart';
import 'package:stacked/stacked.dart';

import 'products_viewmodel.dart';

class ProductsView extends StackedView<ProductsViewModel> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ProductsViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
    BuildContext context,
    ProductsViewModel viewModel,
    Widget? child,
  ) {
    final Size screenSize = MediaQuery.of(context).size;
    final TextEditingController _searchController = TextEditingController();

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter for location and search bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Location',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w100,
                      color: kcVeryLightGrey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Johar Town, Lahore',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      color: kcVeryLightGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenSize.height * 0.075,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [kcDarkGreyColor, kcBlackColor],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Coffee',
                              hintStyle: const TextStyle(
                                color: kcVeryLightGrey,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w100,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  myIcons.search,
                                  color: kcVeryLightGrey,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kcLightCoffeeColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          height: screenSize.height * 0.075,
                          width: screenSize.width * 0.17,
                          child: Center(
                            child: Image.asset(
                              myIcons.filter,
                              color: kcVeryLightGrey,
                              height: screenSize.height * 0.04,
                              width: screenSize.width * 0.075,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter for Coffee Ad Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kcCreamColor,
                  ),
                  height: screenSize.height * 0.165,
                  width: screenSize.width * 0.85,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/coffee.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SliverAppBar for sticky button bar
          SliverAppBar(
            backgroundColor: kcBackgroundColor2,
            surfaceTintColor: Colors.white,
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () => viewModel.changeColor(index),
                      child: Container(
                        height: screenSize.height * 0.038,
                        width: screenSize.width * 0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: viewModel.buttonColors[index],
                        ),
                        child: Center(
                          child: Text(
                            [
                              'All Coffee',
                              'Macchiato',
                              'Latte',
                              'Hot Coffe',
                              'Iced Coffe',
                              'Frappe'
                            ][index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // SliverGrid for Coffee Products
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2.82 / 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final coffee = coffeeList[index];
                  final isFavourite = viewModel.isFavourite(coffee);

                  return FlavourCard(
                    color: kcVeryWhiteColor,
                    title: coffee.name,
                    description: coffee.description,
                    price: coffee.price,
                    buttonIconPath: myIcons.add,
                    favButton: isFavourite
                        ? myIcons.favourite_filled
                        : myIcons.favourite_outlined,
                    onFavPressed: () {
                      if (isFavourite) {
                        viewModel.removeFromFavourites(coffee);
                      } else {
                        viewModel.addToFavourites(coffee);
                      }
                      viewModel.notifyListeners();
                    },
                    imageAsset: coffee.imageAsset,
                    onTap: () => viewModel.navigateToDetail(context, coffee),
                    onButtonPressed: () => viewModel.addItemToCart(coffee),
                  );
                },
                childCount: coffeeList.length,
              ),
            ),
          ),

          // Bottom padding
          SliverToBoxAdapter(
            child: Container(
              height: 90,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductsViewModel();
}
