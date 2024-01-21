import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/custom/widget/error_widget.dart';
import 'package:gitlabtal/module/repository/controller/repository_controller.dart';
import 'package:gitlabtal/route/route_const.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../custom/widget/empty_widget.dart';
import '../../custom/widget/loading_widget.dart';
import '../../data/ProjectEntity.dart';
import 'card_item.dart';

/// 仓库包装页面
class RepositoryWrapperWidget extends StatelessWidget{
  const RepositoryWrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RepositoryWidget(),
    );
  }
}

/// 仓库页面
class RepositoryWidget extends StatefulWidget {
  const RepositoryWidget({super.key});

  @override
  State<RepositoryWidget> createState() => _RepositoryWidgetState();
}

class _RepositoryWidgetState extends State<RepositoryWidget> {
  RepositoryController controller = Get.find();
  final PagingController<int, ProjectEntity> _pagingController =
      PagingController(firstPageKey: 1,invisibleItemsThreshold: 2);
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      refresh(pageKey);
    });
  }

  /// 刷新
  void refresh(int pageKey) {
    controller.fetchData(pageKey, loadMoreBlock: (list, havMore) {
      if (havMore) {
        _pagingController.appendPage(list, pageKey + 1);
      } else {
        _pagingController.appendLastPage(list);
      }
    }, errorBlock: () {
      _pagingController.appendLastPage(List.empty());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back(result: true);

                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  "代码仓库",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                FilledButton.icon(
                    onPressed: () {
                      Get.toNamed(routeSearch);
                    },
                    icon: const Icon(Icons.search),
                    label: const Text("搜索")),
                FilledButton.icon(
                    onPressed: () {
                      _pagingController.refresh();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("刷新"))
              ],
            )),
        Expanded(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),child: PagedListView<int, ProjectEntity>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<ProjectEntity>(
              itemBuilder: (context, item, index) =>
                  _buildItem(index,item, controller,_pagingController),
                firstPageProgressIndicatorBuilder:(context) => const LoadingInnerWidget(),
            ),
          ),),
        ),
      ],
    );
  }

  Widget _buildItem(int index,ProjectEntity item, RepositoryController controller, PagingController<int, ProjectEntity> pagingController) {
    return RepositoryCardItem(index: index,item: item, controller: controller,pagingController: pagingController);
  }
}
