import 'package:get/get.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/provider/search_provider.dart';

class SearchProjectController extends GetxController with StateMixin<String?>{

  SearchProvider provider = Get.find();

  var searchProjects = List<ProjectEntity>.empty(growable: true).obs;


  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<void> searchProject(String text) async {
    change(null, status: RxStatus.loading());
    searchProjects.clear();
    var response = await provider.searchProjects({'scope':'projects','search':text,"private_token": "xL8AdreZ2HZ4EA5SP-pw"});
    List<ProjectEntity> entitiesTemp = [];
    for (var element in response.body) {
      entitiesTemp.add(ProjectEntity.fromJson(element));
    }
    if (entitiesTemp.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(null, status: RxStatus.success());
    }
    searchProjects.addAll(entitiesTemp);
  }

}