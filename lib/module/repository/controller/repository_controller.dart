import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/data/local_project.dart';
import 'package:gitlabtal/storage/databases/sqlite3/sq.dart';
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
  void saveProject(ProjectEntity item) {
    if (item.id == null) {
      Get.defaultDialog(title: "内部错误,此项目没有ID,无法关注。");
      return;
    }
    var localProject = LocalProject(item.id!,
        dir: "",
        createdAt: item.createdAt,
        name: item.name,
        webUrl: item.webUrl,
        readmeUrl: item.readmeUrl,
        rawJson: jsonEncode(item.toJson()));
    SqliteHelper().insert(localProject);
    Get.snackbar("添加完毕", "已添加关注仓库");
    return;
  }
}

/// 被观察的状态
class RepositoryState {
  RepositoryState(bool state);
}
