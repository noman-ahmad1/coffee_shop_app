// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:my_first_app/ui/services/authentication_service.dart';
import 'package:my_first_app/ui/services/cart_service.dart';
import 'package:my_first_app/ui/services/favourites_service.dart';
import 'package:my_first_app/ui/services/notification_service.dart';
import 'package:my_first_app/ui/services/order_service.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton(() => FavouritesService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NotificationService());
}
