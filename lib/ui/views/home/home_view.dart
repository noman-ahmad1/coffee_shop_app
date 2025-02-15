import 'package:flutter/material.dart';
import 'package:my_first_app/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/app_colors.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcBlackColor,
      body: SafeArea(
          child: Column(
        children: [
          const Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Image(
                  image: AssetImage('assets/home.jpg'),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 385),
                  child: Text(
                    'Fall in Love with\nCoffee in Blissful\nDelight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: kcVeryLightGrey,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Welcome to our cozy coffee corner, where\nevery cup is a delightful for you.',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Sora', color: kcLightGrey),
          ),
          SizedBox(
            height: screenSize.height*0.05,
          ),
          GestureDetector(
            onTap: () {
              viewModel.navigateToEmailauth();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: kcLightCoffeeColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: screenSize.height*0.07,
              width: screenSize.width*0.9,
              child: const Padding(
                padding: EdgeInsets.only(top: 19),
                child: Text(
                  'Sign In with Email',
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
          SizedBox(
            height: screenSize.height*0.03,
          ),
          GestureDetector(
            onTap: () {
              viewModel.navigateToDashboard();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: kcLightCoffeeColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: screenSize.height*0.07,
              width: screenSize.width*0.9,
              child: const Padding(
                padding: EdgeInsets.only(top: 19),
                child: Text(
                  'Sign In with Phone',
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
      )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
