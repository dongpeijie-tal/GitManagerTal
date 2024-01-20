import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {

  static final MyColors _instance = MyColors._inner();
  factory MyColors(){
    return _instance;
  }
  MyColors._inner();

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

  static const String blue = 'blue';
  static const Map<bool,Map<ColorName,MaterialColor>> style = {
    true:{ColorName.blue:lightBlueColor},
    false:{ColorName.blue:darkBlueColor}
  };

  MaterialColor getColor(ColorName colorName){
    return style[Get.isDarkMode]![colorName]!;
  }

}

enum ColorName{
  blue,
}