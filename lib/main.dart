import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'module/splash/binding/splash_binding.dart';
import 'module/splash/splash.dart';


void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    home: const SplashWidget(),
    initialBinding: SplashBinding(),
  ));
}