import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/custom/widget/empty_widget.dart';
import 'package:gitlabtal/custom/widget/error_widget.dart';
import 'package:gitlabtal/custom/widget/loading_widget.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/module/search/card_item.dart';
import 'controller/search_controller.dart';

/// 搜索界面
class SearchWrapperWidget extends StatelessWidget {
  SearchWrapperWidget({super.key});

  SearchProjectController controller = Get.find();
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(
            hintText: '搜索<项目关键字>',
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              "搜索",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onPressed: () {
              controller.searchProject(textFieldController.text);
            },
          ),
        ],
      ),
      body: controller.obx(
        (state) => SearchWidget(),
        onLoading: const LoadingInnerWidget(),
        onEmpty: EmptyInnerWidget(title: "空空如也..",),
        onError: (error) => const ErrorInnerWidget(),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  SearchProjectController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: controller.searchProjects.length,
            itemBuilder: (context, index) {
              return _buildItem(controller.searchProjects[index], controller);
            }),
      ),
    );
  }

  Widget _buildItem(ProjectEntity item, SearchProjectController controller) {
    return CardItem(item: item, controller: controller);
  }
}
