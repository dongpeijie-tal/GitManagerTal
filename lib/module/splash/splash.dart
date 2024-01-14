import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../route/route_const.dart';
import 'controller/splash_controller.dart';

/// 闪屏页
class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    Timer(const Duration(seconds: 1), () {
      if (controller.token.isEmpty) {
        Get.toNamed(routeLogin);
      } else {
        Get.toNamed(routeHome);
      }
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text("HAL-Git",style: TextStyle(color: Colors.lightBlue,fontSize: 40,fontWeight: FontWeight.w800),),
        ),
      ),
    );
  }
}
