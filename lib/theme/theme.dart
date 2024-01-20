import 'package:flutter/material.dart';

class AppTheme {
  
  static const fontFamily = 'NotoSansSC';

  static const lightPrimaryColor = Color(0xFF6699CC);
  static const lightBackPrimaryColor = Colors.white;
  static const lightIconPrimaryColor = Colors.black87;
  static const lightTextPrimaryColor = Colors.black87;
  static const lightButtonPrimaryColor = Color(0xFF99ccFF);
  static const lightCardPrimaryColor = Colors.white;
  static const lightCardBackColor = Colors.white;
  static const lightCardShadowColor = Colors.black;

  static ThemeData lightThemeData = ThemeData(
    //大背景色
    scaffoldBackgroundColor: lightBackPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: lightBackPrimaryColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: lightIconPrimaryColor),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: lightPrimaryColor,
        onPrimary: Colors.white,//实心按钮文字颜色
        secondary: Colors.grey,
        onSecondary: Colors.grey,
        error: Colors.red,
        onError: Colors.red,
        background: lightCardPrimaryColor,
        // 按钮背景色
        onBackground: lightButtonPrimaryColor,
        surface: Colors.pink,
        onSurface: lightIconPrimaryColor),
    cardTheme: const CardTheme(
      clipBehavior: Clip.none,
      color: lightCardBackColor,
      //卡片背景色
      shadowColor: lightCardShadowColor,
      surfaceTintColor: lightCardBackColor,
      //卡片背景色
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
    ),
    textTheme: const TextTheme(
      //文本主题，定义了标题、正文等文本的样式。
      displayLarge: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      displayMedium: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      displaySmall: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 14),
      headlineLarge: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      headlineMedium: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      headlineSmall: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 12),
      titleLarge: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 18,),
      titleMedium: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      titleSmall: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 12),
      bodyLarge: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      bodySmall: TextStyle(color: Colors.black, fontFamily: fontFamily,fontWeight: FontWeight.w400,fontSize: 12,height: 1.5),
      labelLarge: TextStyle(color: Colors.white, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      labelMedium: TextStyle(color: Colors.white, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      labelSmall: TextStyle(color: Colors.white, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 12),
      // 其他文本样式...
    ),
  );

  static const darkPrimaryColor = Color(0xEFff7c38);
  static const darkButtonPrimaryColor = Color(0xFFff7c38);
  static const darkBackPrimaryColor = Color(0xFF212121);
  static const darkIconPrimaryColor = Color(0xFFff7c38);
  static const darkTextPrimaryColor = Color(0xFFf7f6e7);
  static const darkCardPrimaryColor = Color(0xFF000000);
  static const darkCardBackColor = Color(0xFF323232);
  static const darkCardShadowColor = Color(0x3Fff7c38);

  static ThemeData darkThemeData = ThemeData(
    //大背景色
    scaffoldBackgroundColor: darkBackPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: darkBackPrimaryColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: darkIconPrimaryColor),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimaryColor,
        onPrimary: Colors.white,//实心按钮文字颜色
        secondary: Colors.grey,
        onSecondary: Colors.grey,
        error: Colors.red,
        onError: Colors.red,
        background: darkCardPrimaryColor,
        // 按钮背景色
        onBackground: darkButtonPrimaryColor,
        surface: Colors.pink,
        onSurface: darkIconPrimaryColor),
    cardTheme: const CardTheme(
      clipBehavior: Clip.none,
      color: darkCardBackColor,
      //卡片背景色
      shadowColor: darkCardShadowColor,
      surfaceTintColor: darkCardBackColor,
      //卡片背景色
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
    ),
    textTheme: const TextTheme(
      //文本主题，定义了标题、正文等文本的样式。
      displayLarge: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      displayMedium: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      displaySmall: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 14),
      headlineLarge: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      headlineMedium: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      headlineSmall: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 12),
      titleLarge: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 18,),
      titleMedium: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      titleSmall: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 12),
      bodyLarge: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      bodyMedium: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      bodySmall: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w400,fontSize: 12,height: 1.5),
      labelLarge: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w600,fontSize: 16),
      labelMedium: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w500,fontSize: 14),
      labelSmall: TextStyle(color: darkTextPrimaryColor, fontFamily: fontFamily,fontWeight: FontWeight.w300,fontSize: 12),
      // 其他文本样式...
    ),
  );
}
