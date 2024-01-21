

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/home/controller/home_controller.dart';

void showGitLogDialog(HomeController controller){
  Get.dialog(Padding(
    padding: const EdgeInsets.all(100),
    child: Container(
      color: Theme.of(Get.context!).primaryColor,
      child: Obx(() => ListView.builder(
        itemCount: controller.gitLogs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            controller.gitLogs[index],
            style: Theme.of(Get.context!).textTheme.labelLarge,
          ),
        ),
      )),
    ),
  ));
}