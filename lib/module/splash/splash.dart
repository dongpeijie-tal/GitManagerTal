import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../provider/user_provider.dart';
import '../home/controller/home_controller.dart';
import '../home/home.dart';
import '../login/login.dart';
import 'controller/splash_controller.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Container(
        color: Colors.amber,
        child: Obx(() {
          if (controller.token.isEmpty) {
            return const LoginWidget();
          }else{
            Get.put(UserProvider());
            Get.put(HomeController());
            return const HomeWidget();
          }
        })
    );
  }
}
