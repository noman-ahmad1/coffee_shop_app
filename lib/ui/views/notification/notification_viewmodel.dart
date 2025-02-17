import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/ui/services/notification_service.dart';
import 'package:stacked/stacked.dart';

class NotificationViewModel extends BaseViewModel {
   final _notificationService = locator<NotificationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_notificationService];

  List get notifications => _notificationService.notifications;
}
