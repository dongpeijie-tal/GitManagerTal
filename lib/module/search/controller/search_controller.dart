

import 'package:get/get.dart';
import 'package:gitlabtal/data/SearchProject.dart';
import 'package:gitlabtal/provider/search_provider.dart';

class SearchProjectController extends GetxController{

  SearchProvider provider = Get.find();

  var searchProjects = List<SearchProject>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> searchProject(String text) async {
    searchProjects.clear();
    var response = await provider.searchProjects({'scope':'projects','search':text,"private_token": "xL8AdreZ2HZ4EA5SP-pw"});
    List<SearchProject> entitiesTemp = [];
    for (var element in response.body) {
      entitiesTemp.add(SearchProject.fromJson(element));
    }
    searchProjects.addAll(entitiesTemp);
  }

}