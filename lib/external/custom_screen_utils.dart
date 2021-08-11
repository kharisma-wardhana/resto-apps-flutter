import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScreenUtils {
  static void initScreenUtils(BuildContext context) {
    BoxConstraints constraint = BoxConstraints(minWidth: 360, minHeight: 640);
    ScreenUtil.init(constraint, designSize: Size(360, 640));
  }
}
