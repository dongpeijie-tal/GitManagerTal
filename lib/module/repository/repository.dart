import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/custom/widget/error_widget.dart';
import 'package:gitlabtal/module/repository/controller/repository_controller.dart';

import '../../custom/widget/empty_widget.dart';
import '../../custom/widget/loading_widget.dart';
import '../../data/ProjectEntity.dart';
import 'card_item.dart';

/// 仓库包装页面
class RepositoryWrapperWidget extends GetView<RepositoryController> {
  const RepositoryWrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => const RepositoryWidget(),
        onLoading: const LoadingInnerWidget(),
        onEmpty: const EmptyInnerWidget(),
        onError: (error) => const ErrorInnerWidget(),
      ),
    );
  }
}

/// 仓库页面
class RepositoryWidget extends StatelessWidget {
  const RepositoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RepositoryController controller = Get.find();
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.builder(
                itemCount: controller.projects.length,
                itemBuilder: (context, index) {
                  return _buildItem(controller.projects[index], controller);
                }),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(ProjectEntity item, RepositoryController controller) {
    return RepositoryCardItem(item: item, controller: controller);
  }
}