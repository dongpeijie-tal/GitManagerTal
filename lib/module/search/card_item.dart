import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/module/search/controller/search_controller.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);

  final ProjectEntity item;
  final SearchProjectController controller;

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
                    Text("简介：${item.description ?? "无"}",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
                child: OutlinedButton(
                    onPressed: () {
                    },
                    child: const Text("添加")),
              ),
            ],
          ),
        ));
  }
}

