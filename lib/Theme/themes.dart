
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';

class Themes {
  static final light = ThemeData.light().copyWith(

    backgroundColor: AppColor.bgColor,
    primaryColor: AppColor.primaryColor,
    secondaryHeaderColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.bgColor,
    shadowColor: Colors.transparent
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}