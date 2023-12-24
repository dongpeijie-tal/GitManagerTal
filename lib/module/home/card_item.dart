import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';

import '../../top/method/top_method.dart';
import 'controller/home_controller.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);

  final ProjectEntity item;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        // 使用Card作为背景
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                iconSize: 20.0,
                color: Colors.black,
                icon: const Icon(Icons.add),
                onPressed: () {
                  // controller.removeEntity(element: item);
                  popGitClone(item.sshUrlToRepo);
                },
              ),
            ],
          ),
          Center(
            child: Padding(
              // 给项目名称添加padding
              padding: EdgeInsets.all(4),
              child: Text(item.name ?? "未命名",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold) // 设置项目名称的字体大小和粗细
                  ),
            ),
          ),
          Padding(
              // 给简介添加padding
              padding: EdgeInsets.all(5),
              child: Text("简介：${item.description ?? "无"}")),
        ],
      ),
    ));
  }

  void popGitClone(String? sshUrlToRepo) async {
    final String? directoryPath = await getDirectoryPath();
    if (directoryPath == null) {
      // Operation was canceled by the user.
      return;
    }
    if(sshUrlToRepo == null || sshUrlToRepo.isEmpty){
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    Get.dialog(GitCloneWidget(sshUrlToRepo,directoryPath));
  }

}

class GitCloneWidget extends StatelessWidget {

  final String path;
  final String directoryPath;

  const GitCloneWidget(this.path, this.directoryPath, {super.key});

  @override
  Widget build(BuildContext context) {
    cloneRepo(path,directoryPath);
    return AlertDialog(
      title: Text("Cloning..."),
      content: Container(child: CircularProgressIndicator()),
    );
  }
}
