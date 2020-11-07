import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodies/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/details', page: () => DetailsPage()),
        GetPage(name: '/about', page: () => AboutPage()),
      ],
    );
  }
}
