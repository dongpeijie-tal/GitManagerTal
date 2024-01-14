
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/provider/user_provider.dart';
import 'package:gitlabtal/top/bean/git_const.dart';
import '../state/state_widget.dart';

class HomeController extends GetxController with StateMixin<HomeState>{
  final provider = Get.find<UserProvider>();
  // var hasEntities = List<ProjectEntity>.empty(growable: true).obs;
  var entities = List<ProjectEntity>.empty(growable: true).obs;
  final box = GetStorage();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async{
    final Response response = await provider.getUser({"private_token" : "xL8AdreZ2HZ4EA5SP-pw","per_page":"10"});
    // final Response response = await provider.getUser({"PRIVATE-TOKEN" : box.read(TOKEN_SIGN)});
    List<ProjectEntity> entitiesTemp = [];
    for (var element in response.body) {
      entitiesTemp.add(ProjectEntity.fromJson(element));
    }
    if(!response.hasError){
      if(entitiesTemp.isEmpty && entitiesTemp.isEmpty){
        change(HomeState(false),status: RxStatus.empty());
      }else{
        change(HomeState(true),status: RxStatus.success());
      }
    }else{
      change(null,status: RxStatus.error(response.bodyString));
    }
    entities.addAll(entitiesTemp);
  }

  void clearUser(){
    box.remove(TOKEN_SIGN);
  }
}
