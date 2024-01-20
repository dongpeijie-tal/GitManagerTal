import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/home/state/state_widget.dart';
import 'package:gitlabtal/module/login/login.dart';
import 'package:gitlabtal/module/repository/repository.dart';
import 'package:gitlabtal/route/route_const.dart';
import '../../custom/widget/empty_widget.dart';
import '../../custom/widget/error_widget.dart';
import '../../custom/widget/loading_widget.dart';
import '../../data/ProjectEntity.dart';
import 'card_item.dart';
import 'controller/home_controller.dart';

/// 主页的包装页
class HomeWrapperWidget extends GetView<HomeController> {
  const HomeWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => const HomeWidget(),
        onLoading: const LoadingInnerWidget(),
        onEmpty: const EmptyInnerWidget(),
        onError: (error) => const ErrorInnerWidget(),
      ),
    );
  }
}

/// 主页
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      // 退出账号
                      controller.clearUser();
                      Get.off(const LoginWidget());
                    },
                    icon: const Icon(Icons.exit_to_app)),
                const Text(
                  "关注的仓库",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {},
                  child: const Text("克隆所有仓库"),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text("拉取所有仓库"),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text("同步所有仓库"),
                ),
                FilledButton.icon(
                    onPressed: () {
                      Get.toNamed(routeRepository);
                    },
                    icon: const Icon(Icons.control_point_sharp),
                    label: Text("代码仓库"))
              ],
            )),
         Expanded(
          child: Obx(
                () => Padding(padding: const EdgeInsets.symmetric(horizontal: 10),child:
                ListView.builder(
                itemCount: controller.entities.length,
                itemBuilder: (context, index) {
                  return _buildItem(controller.entities[index], controller);
                }),
          ),
        ),)
        ,
      ],
    );
  }

  Widget _buildItem(ProjectEntity item, HomeController controller) {
    return CardItem(item: item, controller: controller);
  }
}
