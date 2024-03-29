import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/route/route_const.dart';
import 'package:gitlabtal/theme/color_style.dart';
import '../../custom/widget/empty_widget.dart';
import '../../custom/widget/error_widget.dart';
import '../../custom/widget/loading_widget.dart';
import 'card_item.dart';
import 'controller/home_controller.dart';

/// 主页的包装页
class HomeWrapperWidget extends GetView<HomeController> {
  HomeWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: Tooltip(
            message: "远程仓库",
            child: IconButton(
              onPressed: () async {
                var needRefresh = await Get.toNamed(routeRepository);
                if (needRefresh) {
                  controller.fetchData();
                }
              },
              icon: Icon(
                Icons.local_grocery_store,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Row(
                children: [
                  const Text(
                    "关注的仓库",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Tooltip(
                    message: "设置",
                    child: IconButton(
                      icon: Image.asset(
                        "images/setting_icon.png",
                        width: 24,
                        height: 24,
                        color: AppColors().getColor(ColorName.primary),
                      ),
                      onPressed: () {
                        Get.toNamed(routeSetting);
                      },
                    ),
                  ),
                  Tooltip(
                    message: "清空所有项目",
                    child: IconButton(
                      icon: Image.asset(
                        "images/clear_icon.png",
                        width: 24,
                        height: 24,
                        color: AppColors().getColor(ColorName.primary),
                      ),
                      onPressed: () {
                        controller.deleteAll();
                      },
                    ),
                  ),
                  Tooltip(
                    message: "克隆所有仓库",
                    child: IconButton(
                      icon: Image.asset(
                        "images/clone_icon.png",
                        width: 24,
                        height: 24,
                        color: AppColors().getColor(ColorName.primary),
                      ),
                      onPressed: () {
                        controller.gitCloneAll();
                      },
                    ),
                  ),
                  Tooltip(
                    message: "同步所有仓库",
                    child: IconButton(
                      icon: Image.asset(
                        "images/pull_icon.png",
                        width: 24,
                        height: 24,
                        color: AppColors().getColor(ColorName.primary),
                      ),
                      onPressed: () {
                        controller.gitPullAll();
                      },
                    ),
                  ),
                  Tooltip(
                    message: "拉取所有仓库",
                    child: IconButton(
                      icon: Image.asset(
                        "images/fetch_icon.png",
                        width: 24,
                        height: 24,
                        color: AppColors().getColor(ColorName.primary),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
          Expanded(
            child: controller.obx(
              (state) => const HomeWidget(),
              onLoading: const LoadingInnerWidget(),
              onEmpty: EmptyInnerWidget(),
              onError: (error) => const ErrorInnerWidget(),
            ),
          ),
        ],
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
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: controller.localProjects.length,
            itemBuilder: (context, index) {
              return _buildItem(controller.localProjects[index], controller);
            }),
      ),
    );
  }

  Widget _buildItem(LocalProject item, HomeController controller) {
    return CardItem(item: item, controller: controller);
  }
}
