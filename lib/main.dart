import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/module/home/binding/home_binding.dart';
import 'package:gitlabtal/module/home/home.dart';
import 'module/repository/repository.dart';
import 'module/splash/binding/splash_binding.dart';
import 'module/splash/splash.dart';


void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    // home: const SplashWidget(),
    home: const HomeWidget(),
    // initialBinding: SplashBinding(),
    initialBinding: HomeBinding(),
    getPages: [
      GetPage(name: "/repository", page: ()=>const RepositoryWidget()),
    ],
  ));
}