import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'phoneauth_viewmodel.dart';

class PhoneauthView extends StackedView<PhoneauthViewModel> {
  const PhoneauthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PhoneauthViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  PhoneauthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PhoneauthViewModel();
}
