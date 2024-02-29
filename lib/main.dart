import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/route/route_const.dart';
import 'package:gitlabtal/ui/HomePage.dart';
import 'package:gitlabtal/ui/LoginPage.dart';
import 'package:gitlabtal/ui/SplashPage.dart';

void main() async {
  await GetStorage.init();
  runApp(FluentApp(
    title: "GitTAL",
    routes: {
      splashPage : (context) => const SplashPage(),
      loginPage : (context) => LoginPage(),
      homePage: (context) => HomePage(),
    },
    theme: FluentThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: FluentThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.dark,
    initialRoute: splashPage,
  ));
  //     GetMaterialApp(
  //   theme: AppTheme.lightThemeData,
  //   darkTheme: AppTheme.darkThemeData,
  //   initialRoute: homePage,
  //   getPages: [
  //     GetPage(
  //         name: routeSplash,
  //         page: () => const SplashWidget(),
  //         binding: SplashBinding()),
  //     GetPage(
  //         name: routeLogin,
  //         page: () => const LoginWidget(),
  //         binding: SplashBinding()),
  //     GetPage(
  //         name: routeHome,
  //         page: () => HomeWrapperWidget(),
  //         binding: HomeBinding()),
  //     GetPage(
  //         name: routeRepository,
  //         page: () => const RepositoryWrapperWidget(),
  //         binding: RepositoryBinding()),
  //     GetPage(
  //         name: routeSearch,
  //         page: () => SearchWrapperWidget(),
  //         binding: SearchBinding()),
  //     GetPage(
  //         name: routeSetting,
  //         page: () => SettingWrapperWidget(),
  //         binding: SettingBinding()),
  //     GetPage(name: homePage, page: () => HomePage(), binding: HomeBinding()),
  //   ],
  // ));
}
