import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_first_app/app/app.bottomsheets.dart';
import 'package:my_first_app/app/app.dialogs.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/firebase_options.dart';
import 'package:my_first_app/ui/common/app_constants.dart';
import 'package:my_first_app/ui/services/authentication_service.dart';
import 'package:my_first_app/ui/services/cart_service.dart';
import 'package:my_first_app/ui/services/favourites_service.dart';
import 'package:my_first_app/ui/services/menu_service.dart';
import 'package:my_first_app/ui/services/notification_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'ui/models.dart/coffee_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(CoffeeFlavorAdapter()); // Register the adapter
  await Hive.openBox('cart');
  await Hive.openBox('favourites');
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  final menuService = MenuService();
  await menuService.uploadMenu(coffeeList);
  // await locator<NotificationService>().initializeNotifications();

  runApp(const MainApp());
  print('User granted permission: ${settings.authorizationStatus}');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background notification received: ${message.notification?.title}");
}
