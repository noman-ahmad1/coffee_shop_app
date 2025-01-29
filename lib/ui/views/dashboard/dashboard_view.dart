import 'package:flutter/material.dart';
import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:my_first_app/ui/views/cart/cart_view.dart';
import 'package:my_first_app/ui/views/dashboard/detail.dart';
import 'package:my_first_app/ui/views/favourites/favourites_view.dart';
import 'package:my_first_app/ui/views/home/home_viewmodel.dart';
import 'package:my_first_app/ui/views/dashboard/bottom_bar.dart';
import 'package:my_first_app/ui/views/products/products_view.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/widgets/flavour_card.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  final bool test;
  const DashboardView({Key? key, required this.test}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    final Size screenSize = MediaQuery.of(context).size;
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: kcBackgroundColor2,
      body: Stack(children: [
        Container(
          height: screenSize.height * 0.34,
          color: kcBackgroundColor,
        ),
        if (viewModel.currentIndex == 0) ProductsView(),
        if (viewModel.currentIndex == 1)
          const FavouritesView(),
        if (viewModel.currentIndex == 2)
          CartView(onNavigateToProducts: () {
            viewModel.setIndex(0);
          }),
        if (viewModel.currentIndex == 3)
          Container(
            child: Text("Notifications"),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
            key: Key(viewModel.totalItemCount.toString()),
          ),
        )
      ]),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
