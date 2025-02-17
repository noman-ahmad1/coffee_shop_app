import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
          appBar: AppBar(title: Text('Recent Notifications')),
          body: ListView.builder(
            itemCount: viewModel.notifications.length,
            itemBuilder: (context, index) {
              final notification = viewModel.notifications[index];
              return ListTile(
                title: Text(notification.notification?.title ?? 'No Title'),
                subtitle: Text(notification.notification?.body ?? 'No Body'),
                onTap: () {
                  
                },
              );
            },
          ),
        );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
