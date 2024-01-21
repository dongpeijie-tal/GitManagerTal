import 'package:flutter/material.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:infinite_scroll_pagination/src/core/paging_controller.dart';
import 'controller/repository_controller.dart';

class RepositoryCardItem extends StatelessWidget {
  const RepositoryCardItem({
    Key? key,
    required this.item,
    required this.controller,
    required this.pagingController,
    required this.index,
  }) : super(key: key);

  final int index;
  final ProjectEntity item;
  final RepositoryController controller;
  final PagingController<int, ProjectEntity> pagingController;

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
                const SizedBox(
                  height: 5,
                ),
                Text("地址：${item.httpUrlToRepo ?? "无"}",
                    style: Theme.of(context).textTheme.bodySmall),
                Text("简介：${item.description ?? "无"}",
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
            child: FilledButton(
                onPressed: () async {
                  if (item.isSaveLocal != true) {
                    await controller.saveProject(item);
                    pagingController.refresh();
                  }
                },
                child: item.isSaveLocal??false
                    ? Text("已添加",
                        style: Theme.of(context).textTheme.labelMedium)
                    : Text(
                        "添加",
                        style: Theme.of(context).textTheme.labelMedium,
                      )),
          ),
        ],
      ),
    ));
  }
}
