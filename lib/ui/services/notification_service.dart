import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked.dart';

class NotificationService with ReactiveServiceMixin {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  List<RemoteMessage> _notifications = [];

  List<RemoteMessage> get notifications => _notifications;

  NotificationService() {
    _setupNotifications();
  }

  Future<void> _setupNotifications() async {
    // Request permissions
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else {
      print("User denied or has not accepted permission");
    }

    // Initialize local notifications
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (response) {
      _handleNotificationTap(response.payload);
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
      _notifications.add(message);
      notifyListeners();
    });

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationTap(message.data['route']);
    });

    // Handle notification tap when app is terminated
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _handleNotificationTap(message.data['route']);
      }
    });
  }

  void _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'Channel Name',
            importance: Importance.max, priority: Priority.high);

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      message.messageId.hashCode,
      message.notification?.title,
      message.notification?.body,
      details,
      payload: message.data['route'], // Handle navigation
    );
  }

  void _handleNotificationTap(String? route) {
    if (route != null) {
      // Navigate based on route
    }
  }
}
