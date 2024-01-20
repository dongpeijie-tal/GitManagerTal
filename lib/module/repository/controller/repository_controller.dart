import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/custom/dialog/prgress.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/storage/databases/hive/hive_helper.dart';
import '../../../data/ProjectEntity.dart';
import '../../../provider/repository_provider.dart';

/// 仓库页面的控制器 混入 仓库页面状态监听
class RepositoryController extends GetxController
    with StateMixin<RepositoryState> {
  final provider = Get.find<RepositoryProvider>();
  var projects = List<ProjectEntity>.empty(growable: true).obs;
  final box = GetStorage();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
  /// 刷新数据
  Future<void> refreshData() async {
    projects.clear();
    fetchData();
    HiveHelper().queryAllLocalProject();
  }

  Future<void> fetchData() async {
    final Response response = await provider.getProjects(
        {"private_token": "xL8AdreZ2HZ4EA5SP-pw", "per_page": "10"});
    // final Response response = await provider.getUser({"PRIVATE-TOKEN" : box.read(TOKEN_SIGN)});
    List<ProjectEntity> entitiesTemp = [];
    for (var element in response.body) {
      entitiesTemp.add(ProjectEntity.fromJson(element));
    }
    if (!response.hasError) {
      if (entitiesTemp.isEmpty && entitiesTemp.isEmpty) {
        change(RepositoryState(false), status: RxStatus.empty());
      } else {
        change(RepositoryState(true), status: RxStatus.success());
      }
    } else {
      change(null, status: RxStatus.error(response.bodyString));
    }
    projects.addAll(entitiesTemp);
  }

  /// 保存到关注项目
  Future<void> saveProject(ProjectEntity item) async {
    if (item.id == null) {
      Get.defaultDialog(title: "内部错误,此项目没有ID,无法关注。");
      return;
    }
    var localProject = LocalProject(item.id!,
        dir: "",
        createdAt: item.createdAt,
        name: item.name,
        webUrl: item.webUrl,
        rawJson: jsonEncode(item.toJson()));
    await showProgressDialog("添加成功","添加失败","此仓库已添加您的关注列表！","抱歉，因为一些意外，重新试试？",()=>HiveHelper().insertLocalProject(localProject));
    return;
  }
}

/// 被观察的状态
class RepositoryState {
  RepositoryState(bool state);
}
