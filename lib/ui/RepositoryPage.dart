import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../custom/widget/loading_widget.dart';
import '../data/ProjectEntity.dart';
import '../module/repository/card_item.dart';
import '../module/repository/controller/repository_controller.dart';
import '../provider/repository_provider.dart';

class RepositoryPage extends StatelessWidget {
  const RepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      padding: EdgeInsets.all(0),
      content: RepositoryWidget(),
    );
  }
}

/// 仓库页面
class RepositoryWidget extends StatefulWidget {
  RepositoryWidget({super.key}) {
    Get.put(RepositoryProvider());
    Get.put(RepositoryController());
  }

  @override
  State<RepositoryWidget> createState() => _RepositoryWidgetState();
}

class _RepositoryWidgetState extends State<RepositoryWidget> {
  RepositoryController controller = Get.find();
  final PagingController<int, ProjectEntity> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 2);

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3),
          child: TextBox(
            textInputAction: TextInputAction.search,
            onChanged: (s){
              // TODO 查找对应的库
            },
            prefix: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(FluentIcons.search),
            ),
            placeholder: '根据仓库名搜索',
          ),
        ),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     TextBox(
        //       placeholder: '根据仓库名搜索',
        //     ),
        //     IconButton(onPressed: (){}, icon: const Icon(FluentIcons.search))
        //   ],
        // ),
        Flexible(
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PagedListView<int, ProjectEntity>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<ProjectEntity>(
                itemBuilder: (context, item, index) =>
                    _buildItem(index, item, controller, _pagingController),
                firstPageProgressIndicatorBuilder: (context) =>
                    const LoadingInnerWidget(),
                newPageProgressIndicatorBuilder: (context) => const Padding(
                    padding: EdgeInsets.all(4), child: ProgressBar()),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(
      int index,
      ProjectEntity item,
      RepositoryController controller,
      PagingController<int, ProjectEntity> pagingController) {
    return RepositoryCardItem(
        index: index,
        item: item,
        controller: controller,
        pagingController: pagingController);
  }
}
