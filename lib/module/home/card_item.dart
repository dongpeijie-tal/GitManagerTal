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
                            fontWeight: FontWeight.bold)),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                child: OutlinedButton(
                    onPressed: () {
                      _gitClone(item.sshUrlToRepo);
                    },
                    child: const Text("克隆clone")),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                child: OutlinedButton(
                    onPressed: () {
                      _gitFetch(item.sshUrlToRepo);
                    }, child: const Text("拉取fetch")),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                child: OutlinedButton(
                    onPressed: () {
                      _gitPull(item.sshUrlToRepo);
                    }, child: const Text("同步pull")),
              ),
            ],
          ),
        ));
  }
  /// 克隆实现
  void _gitClone(String? sshUrlToRepo) async {
    final String? directoryPath = await getDirectoryPath();
    if (directoryPath == null) {
      return;
    }
    if (sshUrlToRepo == null || sshUrlToRepo.isEmpty) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    // TODO 实现方式更换
    cloneRepo(sshUrlToRepo, directoryPath, () {
      Get.snackbar("clone", "成功！");
    }, (msg) {
      Get.snackbar("clone", "失败..因为-->$msg");
    });
  }

  /// 拉取实现
  void _gitFetch(String? sshUrlToRepo) async {
    if (sshUrlToRepo == null || sshUrlToRepo.isEmpty) {
      Get.snackbar("错误", "该仓库没有ssh地址。");
      return;
    }
    final String? directoryPath = await getDirectoryPath();
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
    final String? directoryPath = await getDirectoryPath();
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
