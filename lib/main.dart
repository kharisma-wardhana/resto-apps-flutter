import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodies/ui/pages/pages.dart';
import 'package:foodies/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: GetMaterialApp(
        home: _mainPage(context),
      ),
    );
  }

  Future<bool> checkFirstOpen() async {
    // check sharedpreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firtLaunch = prefs.getBool('first_launch');
    return firtLaunch;
  }

  Widget _mainPage(BuildContext context) {
    return FutureBuilder(
      future: checkFirstOpen(),
      builder: (_, snapshot) {
        if (snapshot.data == null) {
          return OnboardPage();
        }
        return HomePage();
      },
    );
  }
}
