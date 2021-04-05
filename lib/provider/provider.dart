import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:foodies/helpers/db_helper.dart';
import 'package:foodies/helpers/preference_helper.dart';
import 'package:foodies/models/models.dart';
import 'package:foodies/services/services.dart';
import 'package:foodies/helpers/date_time_helper.dart';
import 'package:foodies/helpers/background_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'restaurant_provider.dart';
part 'favorite_provider.dart';
part 'alarm_provider.dart';
part 'preference_provider.dart';

enum ResultState { Loading, NoData, HasData, Error }
