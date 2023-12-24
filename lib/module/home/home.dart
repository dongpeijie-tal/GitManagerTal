import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/home/state/state_widget.dart';
import '../../data/ProjectEntity.dart';
import 'card_item.dart';
import 'controller/home_controller.dart';

class HomeWidget extends GetView<HomeController> {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => const Home(),
        onLoading: const LoadingWidget(),
        onEmpty: const EmptyWidget(),
        onError: (error) => const ErrorInnerWidget(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    int crossAxisCount = (MediaQuery.of(context).size.width / 200).floor();
    return Obx(
      () => GridView.builder(
          itemCount: controller.entities.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // 这里设置列数，你可以根据需要进行修改
            mainAxisSpacing: 10.0, // 主轴方向间距
            crossAxisSpacing: 10.0, // 横轴方向间距
            // childAspectRatio: 0.5, // 子组件宽高长度比例
          ),
          itemBuilder: (context, index) {
            return _buildItem(controller.entities[index], controller);
          }),
    );
  }

  Widget _buildItem(ProjectEntity item, HomeController controller) {
    return CardItem(item: item, controller: controller);
  }
}
