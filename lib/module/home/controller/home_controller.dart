
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/provider/user_provider.dart';
import 'package:gitlabtal/top/bean/top_const.dart';
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
    final Response response = await provider.getUser({"PRIVATE-TOKEN" : box.read(TOKEN_SIGN)});
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

  // Future<void> insertHasEntity(ProjectEntity element) async{
  //   hasEntities.add(element);
  // }

  // Future<void> removeEntity({int? index,ProjectEntity? element}) async{
  //   if(index != null){
  //     entities.removeAt(index);
  //   }
  //   if(element != null){
  //     hasEntities.add(element);
  //     entities.remove(element);
  //   }
  // }
}
