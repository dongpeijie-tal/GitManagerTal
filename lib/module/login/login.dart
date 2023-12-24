
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/home/binding/home_binding.dart';
import 'package:gitlabtal/module/home/home.dart';
import '../splash/controller/splash_controller.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final constroller = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: Colors.indigo, // 设置页面背景色为深蓝色
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3, // 设置卡片最大宽度为窗口大小的三分之一
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:<Widget>[
                  Text("GitLab", style : TextStyle(fontSize : 24, fontWeight : FontWeight.bold)), // 添加logo文字 "GitLab"
                  SizedBox(height :10),
                  TextField(
                    controller:_controller,
                    decoration: InputDecoration(
                      labelText:'Enter Token',
                      suffixIcon:_controller.text.isEmpty ? null : IconButton(iconSize : 20.0, icon:new Icon(Icons.clear), onPressed:(() => _controller.clear())),
                    ),
                  ),
                  SizedBox(height :10),
                  ElevatedButton(onPressed:(() {
                    // 在这里添加按钮点击时需要执行的代码
                    constroller.putUserToken(_controller.text);
                    Get.off(HomeWidget(),binding: HomeBinding());
                  }),
                      style:ElevatedButton.styleFrom(shape:new RoundedRectangleBorder(borderRadius:new BorderRadius.circular(30.0)), primary :Colors.blue,),
                      child:new Text('Confirm')
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

