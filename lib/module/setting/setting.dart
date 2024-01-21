import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/route/route_const.dart';
import 'package:gitlabtal/theme/color_style.dart';

class SettingWrapperWidget extends StatelessWidget {
  const SettingWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("设置",style: Theme.of(context).textTheme.titleLarge,),),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('深色模式'),
            trailing: Switch(
              hoverColor: Colors.transparent,
              inactiveThumbColor: Colors.white,
              activeColor: Colors.white,
              value: Get.isDarkMode, // 你可以根据实际情况设置这个值
              onChanged: (bool value) {
                Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                Get.offAndToNamed(routeHome);
              },
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Divider(),),
          ListTile(
            title: const Text('登出账号'),
            trailing: ElevatedButton(
              child: const Text('登出',style: TextStyle(color: Colors.white),),
              onPressed: () {
                // 在这里处理按钮点击事件
              },
            ),
          ),
        ],
      ),
    );
  }
}
