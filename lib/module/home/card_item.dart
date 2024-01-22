import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/theme/color_style.dart';
import '../../top/method/git_method.dart';
import 'controller/home_controller.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);

  final LocalProject item;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    style: Theme.of(context).textTheme.titleLarge),
                Text("地址：${item.webUrl ?? "无"}",
                    style: Theme.of(context).textTheme.bodySmall),
                Text("简介：${item.createdAt ?? "无"}",
                    style: Theme.of(context).textTheme.bodySmall),
                Row(
                  children: [
                    Text("文件夹：", style: Theme.of(context).textTheme.bodySmall),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          controller.changeLocalProjectDir(item);
                        },
                        child: Text(
                          "${item.dir?.isEmpty == true ? "无" : item.dir}",
                          style: TextStyle(
                              color: AppColors().getColor(ColorName.blue)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            child: OutlinedButton(
                onPressed: () {
                  controller.gitClone(item);
                },
                child: const Text("clone")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            child: OutlinedButton(
                onPressed: () {
                  _gitFetch(item.webUrl);
                },
                child: const Text("fetch")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            child: OutlinedButton(
                onPressed: () {
                  _gitPull(item.webUrl);
                },
                child: const Text("pull")),
          ),
        ],
      ),
    ));
  }

  /// 拉取实现
  void _gitFetch(String? sshUrlToRepo) async {
    if (sshUrlToRepo == null || sshUrlToRepo.isEmpty) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    final String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath == null) {
      return;
    }
    // TODO 实现方式更换
    fetchRepo(sshUrlToRepo, directoryPath, (msg) {
      Get.snackbar("clone", "成功！");
    }, (msg) {
      Get.snackbar("clone", "失败..因为-->$msg");
    });
  }

  /// 同步实现
  void _gitPull(String? sshUrlToRepo) async {
    if (sshUrlToRepo == null || sshUrlToRepo.isEmpty) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    final String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath == null) {
      return;
    }
    // TODO 实现方式更换
    pullRepo(sshUrlToRepo, directoryPath, (msg) {
      Get.snackbar("clone", "成功！");
    }, (msg) {
      Get.snackbar("clone", "失败..因为-->$msg");
    });
  }
}

class GitCloneWidget extends StatelessWidget {
  final String path;
  final String directoryPath;

  const GitCloneWidget(this.path, this.directoryPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              children: List.generate(9, (index) {
                return Card(
                  child: Center(child: Text('Card $index')),
                );
              }),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
