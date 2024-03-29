import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/custom/dialog/prgress.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/storage/databases/hive/hive_helper.dart';
import 'package:material_dialogs/dialogs.dart';
import '../../../data/ProjectEntity.dart';
import '../../../provider/repository_provider.dart';

/// 仓库页面的控制器 混入 仓库页面状态监听
class RepositoryController extends GetxController{
  final provider = Get.find<RepositoryProvider>();
  final box = GetStorage();

  /// 刷新数据
  Future<void> fetchData(int pageKey,{void Function(List<ProjectEntity>,bool)? loadMoreBlock,void Function()? errorBlock}) async {
    final Response response = await provider.getProjects({"private_token": "xL8AdreZ2HZ4EA5SP-pw", 'page': '$pageKey',"per_page": "10"});
    // final Response response = await provider.getUser({"PRIVATE-TOKEN" : box.read(TOKEN_SIGN)});
    List<ProjectEntity> entitiesTemp = [];
    for (var element in response.body) {
      var temp = ProjectEntity.fromJson(element);
      bool isSave = await HiveHelper().isSaveLocalProject(temp);
      temp.isSaveLocal = isSave;
      entitiesTemp.add(temp);
    }
    if (!response.hasError) {
      if (entitiesTemp.isEmpty && entitiesTemp.isEmpty) {
        loadMoreBlock?.call(entitiesTemp,false);
      } else {
        loadMoreBlock?.call(entitiesTemp,true);
      }
    }else{
      errorBlock?.call();
    }
  }

  /// 保存到关注项目
  Future<void> saveProject(ProjectEntity item) async {
    if (item.id == null) {
      Dialogs.materialDialog(context: Get.context!,title: "内部错误,此项目没有ID,无法关注。");
      // Get.defaultDialog(title: "内部错误,此项目没有ID,无法关注。");
      return;
    }
    var localProject = LocalProject(item.id!,
        dir: "",
        createdAt: item.createdAt,
        name: item.name,
        webUrl: item.httpUrlToRepo,
        rawJson: jsonEncode(item.toJson()));
    await showProgressDialog("添加成功","添加失败","此仓库已添加您的关注列表！","抱歉，因为一些意外，重新试试？",()=>HiveHelper().insertLocalProject(localProject));
    return;
  }

  var searchProjects = List<ProjectEntity>.empty(growable: true).obs;
  /// 搜索仓库
  Future<void> searchProject(String text) async {
    searchProjects.clear();
    var response = await provider.searchProjects({'scope':'projects','search':text,"private_token": "xL8AdreZ2HZ4EA5SP-pw"});
    List<ProjectEntity> entitiesTemp = [];
    for (var element in response.body) {
      entitiesTemp.add(ProjectEntity.fromJson(element));
    }
    searchProjects.addAll(entitiesTemp);
  }

}

/// 被观察的状态
class RepositoryState {
  RepositoryState(bool state);
}
