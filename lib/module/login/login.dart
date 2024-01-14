
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
      backgroundColor: Colors.indigo, // 设置页面背景色为深蓝色
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3, // 设置卡片最大宽度为窗口大小的三分之一
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:<Widget>[
                  const Text("GitLab", style : TextStyle(fontSize : 24, fontWeight : FontWeight.bold)), // 添加logo文字 "GitLab"
                  const SizedBox(height :10),
                  TextField(
                    controller:editController,
                    decoration: InputDecoration(
                      labelText:'Enter Token',
                      suffixIcon:editController.text.isEmpty ? null : IconButton(iconSize : 20.0, icon:const Icon(Icons.clear), onPressed:(() => editController.clear())),
                    ),
                  ),
                  const SizedBox(height :10),
                  ElevatedButton(onPressed:(() {
                    // 在这里添加按钮点击时需要执行的代码
                    controller.putUserToken(editController.text);
                    Get.off(const HomeWrapperWidget(),binding: HomeBinding());
                  }),
                      style:ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0)), foregroundColor :Colors.blue,),
                      child:const Text('Confirm')
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

