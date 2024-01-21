import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/home/binding/home_binding.dart';
import 'package:gitlabtal/module/home/home.dart';
import '../splash/controller/splash_controller.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController editController = TextEditingController();
    final controller = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3, // 设置卡片最大宽度为窗口大小的三分之一
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("GitLab",
                      style: Theme.of(context).textTheme.titleLarge), // 添加logo文字 "GitLab"
                  const SizedBox(height: 10),
                  TextField(
                    controller: editController,
                    decoration: InputDecoration(
                      labelText: 'git private-token',
                      suffixIcon: editController.text.isEmpty
                          ? null
                          : IconButton(
                              iconSize: 20.0,
                              icon: const Icon(Icons.clear),
                              onPressed: (() => editController.clear())),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (() {
                        // 在这里添加按钮点击时需要执行的代码
                        controller.putUserToken(editController.text);
                        Get.off(HomeWrapperWidget(),
                            binding: HomeBinding());
                      }),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('进入',style : Theme.of(context).textTheme.labelLarge))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
