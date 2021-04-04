import 'dart:ui';
import 'dart:isolate';

import 'package:foodies/helpers/notification_helper.dart';
import 'package:foodies/main.dart';
import 'package:foodies/services/services.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static late BackgroundService? _instance;
  static late SendPort? _uiSendPort;
  static String _isolateName = 'isolate';

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    print('Alartm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var result = await RestaurantServices.getListRestaurant();
    await _notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      result.data,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  Future<void> someTask() async {
    print('Execute some process');
  }
}
