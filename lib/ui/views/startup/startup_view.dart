import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
        backgroundColor: kcCreamColor,
        body: Padding(
          padding: EdgeInsets.only(top: 120),
          child: Center(
            child: Stack(
              children: [
                Image(image: AssetImage('assets/Splash.png')),
              ],
            ),
          ),
        ));
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
