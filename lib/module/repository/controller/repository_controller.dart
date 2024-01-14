import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/ProjectEntity.dart';
import '../../../provider/repository_provider.dart';

/// 仓库页面的控制器 混入 仓库页面状态监听
class RepositoryController extends GetxController with StateMixin<RepositoryState>{
  final provider = Get.find<RepositoryProvider>();
  var projects = List<ProjectEntity>.empty(growable: true).obs;
  final box = GetStorage();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async{
    final Response response = await provider.getProjects({"private_token" : "xL8AdreZ2HZ4EA5SP-pw","per_page":"10"});
    // final Response response = await provider.getUser({"PRIVATE-TOKEN" : box.read(TOKEN_SIGN)});
    List<ProjectEntity> entitiesTemp = [];
    for (var element in response.body) {
      entitiesTemp.add(ProjectEntity.fromJson(element));
    }
    if(!response.hasError){
      if(entitiesTemp.isEmpty && entitiesTemp.isEmpty){
        change(RepositoryState(false),status: RxStatus.empty());
      }else{
        change(RepositoryState(true),status: RxStatus.success());
      }
    }else{
      change(null,status: RxStatus.error(response.bodyString));
    }
    projects.addAll(entitiesTemp);
  }
}

/// 被观察的状态
class RepositoryState{
  RepositoryState(bool state);

}