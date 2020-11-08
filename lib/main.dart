import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodies/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: OnboardPage(),
    );
  }

  Future<bool> checkFirstOpen() async {
    // check sharedpreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_login');
  }

  Widget home() {
    return FutureBuilder(
      future: checkFirstOpen(),
      builder: (_, snapshot) {
        if (snapshot.data) {
          return HomePage();
        }
        return OnboardPage();
      },
    );
  }
}
