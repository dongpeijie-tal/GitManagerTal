import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/module/home/binding/home_binding.dart';
import 'package:gitlabtal/module/home/home.dart';
import 'package:gitlabtal/module/search/binding/search_binding.dart';
import 'package:gitlabtal/module/search/search.dart';
import 'package:gitlabtal/module/setting/binding/SettingBinding.dart';
import 'package:gitlabtal/module/setting/setting.dart';
import 'package:gitlabtal/route/route_const.dart';
import 'package:gitlabtal/theme/theme.dart';
import 'module/login/login.dart';
import 'module/repository/binding/repository_binding.dart';
import 'module/repository/repository.dart';
import 'module/splash/binding/splash_binding.dart';
import 'module/splash/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    theme: AppTheme.lightThemeData,
    darkTheme: AppTheme.darkThemeData,
    initialRoute: routeHome,
    getPages: [
      GetPage(
          name: routeSplash,
          page: () => const SplashWidget(),
          binding: SplashBinding()),
      GetPage(
          name: routeLogin,
          page: () => const LoginWidget(),
          binding: SplashBinding()),
      GetPage(
          name: routeHome,
          page: () => HomeWrapperWidget(),
          binding: HomeBinding()),
      GetPage(
          name: routeRepository,
          page: () => const RepositoryWrapperWidget(),
          binding: RepositoryBinding()),
      GetPage(
          name: routeSearch,
          page: () => SearchWrapperWidget(),
          binding: SearchBinding()),
      GetPage(
          name: routeSetting,
          page: () => SettingWrapperWidget(),
          binding: SettingBinding()),
    ],
  ));
}
