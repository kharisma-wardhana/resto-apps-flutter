import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodies/helpers/background_services.dart';
import 'package:foodies/helpers/db_helper.dart';
import 'package:foodies/helpers/notification_helper.dart';
import 'package:foodies/helpers/preference_helper.dart';
import 'package:foodies/ui/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodies/ui/pages/pages.dart';
import 'package:foodies/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) => AlarmProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: _mainPage(context),
      ),
    );
  }

  Future<bool?> checkFirstOpen() async {
    // check sharedpreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firtLaunch = prefs.getBool('first_launch');
    return firtLaunch;
  }

  Widget _mainPage(BuildContext context) {
    return FutureBuilder(
      future: checkFirstOpen(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return OnboardPage();
          }
          return HomePage();
        }
        return CustomLoading();
      },
    );
  }
}
