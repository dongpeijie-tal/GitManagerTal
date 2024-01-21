import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {

  static final AppColors _instance = AppColors._inner();
  factory AppColors(){
    return _instance;
  }
  AppColors._inner();

  static const MaterialColor lightBlueColor = MaterialColor(
    0xFF2196F3,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const MaterialColor lightPrimaryColor = MaterialColor(
    0xFF6699CC,
    <int, Color>{
      50: Color(0xFF6699CC),
      100: Color(0xFF6699CC),
      200: Color(0xFF6699CC),
      300: Color(0xFF6699CC),
      400: Color(0xFF6699CC),
      500: Color(0xFF6699CC),
      600: Color(0xFF6699CC),
      700: Color(0xFF6699CC),
      800: Color(0xFF6699CC),
      900: Color(0xFF6699CC),
    },
  );
  static const MaterialColor lightButtonTextColor = MaterialColor(
    0xDD000000,
    <int, Color>{
      50: Color(0xDD000000),
      100: Color(0xDD000000),
      200: Color(0xDD000000),
      300: Color(0xDD000000),
      400: Color(0xDD000000),
      500: Color(0xDD000000),
      600: Color(0xDD000000),
      700: Color(0xDD000000),
      800: Color(0xDD000000),
      900: Color(0xDD000000),
    },
  );

  static const MaterialColor darkBlueColor = MaterialColor(
    0xFF2196F3,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const MaterialColor darkPrimaryColor = MaterialColor(
    0xEFff7c38,
    <int, Color>{
      50: Color(0xEFff7c38),
      100: Color(0xEFff7c38),
      200: Color(0xEFff7c38),
      300: Color(0xEFff7c38),
      400: Color(0xEFff7c38),
      500: Color(0xEFff7c38),
      600: Color(0xEFff7c38),
      700: Color(0xEFff7c38),
      800: Color(0xEFff7c38),
      900: Color(0xEFff7c38),
    },
  );
  static const MaterialColor darkButtonTextColor = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static const String blue = 'blue';
  static const Map<bool,Map<ColorName,MaterialColor>> style = {
    false:{ColorName.blue:lightBlueColor,ColorName.primary:lightPrimaryColor,ColorName.buttonText:lightButtonTextColor},
    true:{ColorName.blue:darkBlueColor,ColorName.primary:darkPrimaryColor,ColorName.buttonText:darkButtonTextColor}
  };

  MaterialColor getColor(ColorName colorName){
    return style[Get.isDarkMode]![colorName]!;
  }

}

enum ColorName{
  blue,
  primary,
  buttonText
}