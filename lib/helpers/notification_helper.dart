import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodies/models/models.dart';
import 'package:foodies/ui/pages/pages.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static late NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        print('notification payload: ' + payload!);
        selectNotificationSubject.add(payload);
      },
    );
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      List<Restaurant>? listRestaurants) async {
    var _channelId = "1";
    var _channelName = "channel_01";
    var _channelDescription = "foodies restaurant";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: DefaultStyleInformation(true, true),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    var titleNotification = "<b>Trending Restaurant</b>";
    listRestaurants = listRestaurants?..shuffle();
    Restaurant? restaurant =
        listRestaurants == null ? null : listRestaurants[0];
    var titleResto = restaurant?.name;

    await flutterLocalNotificationsPlugin.show(
      Random().nextInt(10),
      titleNotification,
      titleResto,
      platformChannelSpecifics,
      payload: jsonEncode(restaurant?.toJson()),
    );
  }

  void configureSelectNotificationSubject(BuildContext context, String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      var resto = Restaurant.fromJson(jsonDecode(payload));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            onBackPressed: () {
              Navigator.of(context).pop();
            },
            restaurant: resto,
          ),
        ),
      );
    });
  }
}
