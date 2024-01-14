import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';

import '../../top/method/git_method.dart';
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
        elevation: 2,
        shadowColor: Colors.tealAccent,
        // 使用Card作为背景
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name ?? "未命名",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                        ),
                    Text("地址：${item.httpUrlToRepo ?? "无"}",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 12)),
                    Text("简介：${item.description ?? "无"}",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 12)),
                    Text("文件夹：${item.createdAt ?? "无"}",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 12)),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                child: OutlinedButton(onPressed: () {popGitClone(item.sshUrlToRepo);}, child: const Text("克隆clone")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                child: OutlinedButton(onPressed: () {}, child: const Text("拉取fetch")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                child: OutlinedButton(onPressed: () {}, child: const Text("同步pull")),
              ),
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
    if (sshUrlToRepo == null || sshUrlToRepo.isEmpty) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    Get.dialog(GitCloneWidget(sshUrlToRepo, directoryPath));
  }
}

class GitCloneWidget extends StatelessWidget {
  final String path;
  final String directoryPath;

  const GitCloneWidget(this.path, this.directoryPath, {super.key});

  @override
  Widget build(BuildContext context) {
    cloneRepo(path, directoryPath, () {}, (msg) {});
    return AlertDialog(
      title: Text("Cloning..."),
      content: Container(child: CircularProgressIndicator()),
    );
  }
}
