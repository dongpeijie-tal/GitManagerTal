

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showProgressDialog(String successTitle,String failTitle,String successText,String failText,Future<bool> Function() runner)async{
  // 显示加载对话框
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(),
    ),
    barrierDismissible: false,  // 用户不能通过点击对话框外部来关闭对话框
  );
  try {
    // 执行任务
    var insertResult = await runner();
    // 更新对话框的内容
    Get.back();  // 先关闭加载对话框
    Get.dialog(
      AlertDialog(
        title: Text(successTitle),
        content: Text(insertResult ? successText : failText),
        actions: <Widget>[
          TextButton(
            child: Text('确定'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  } catch (e) {
    // 如果任务出错，也更新对话框的内容
    Get.back();  // 先关闭加载对话框
    Get.dialog(
      AlertDialog(
        title: Text(failTitle),
        content: Text(e.toString()),
        actions: <Widget>[
          TextButton(
            child: Text('确定'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}