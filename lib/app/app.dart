import 'package:my_first_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_first_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_first_app/ui/views/home/home_view.dart';
import 'package:my_first_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_view.dart';
import 'package:my_first_app/ui/views/Order/order_view.dart';
import 'package:my_first_app/ui/views/map/map_view.dart';
import 'package:my_first_app/ui/views/detail/detail_view.dart';
import 'package:my_first_app/ui/views/cart/cart_view.dart';
import 'package:my_first_app/ui/views/home_screen/home_screen_view.dart';
import 'package:my_first_app/ui/views/products/products_view.dart';
import 'package:my_first_app/ui/views/favourites/favourites_view.dart';
import 'package:my_first_app/ui/views/emailauth/emailauth_view.dart';
import 'package:my_first_app/ui/views/phoneauth/phoneauth_view.dart';
import 'package:my_first_app/ui/views/signup/signup_view.dart';
import 'package:my_first_app/ui/views/notification/notification_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: OrderView),
    MaterialRoute(page: MapView),
    MaterialRoute(page: DetailView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: HomeScreenView),
    MaterialRoute(page: ProductsView),
    MaterialRoute(page: FavouritesView),
    MaterialRoute(page: EmailauthView),
    MaterialRoute(page: PhoneauthView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: NotificationView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
