import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/data/LocalProject.dart';
import 'package:gitlabtal/data/ProjectEntity.dart';
import 'package:gitlabtal/provider/user_provider.dart';
import 'package:gitlabtal/storage/databases/hive/hive_helper.dart';
import 'package:gitlabtal/top/bean/git_const.dart';
import '../state/state_widget.dart';

class HomeController extends GetxController with StateMixin<HomeState> {
  final provider = Get.find<UserProvider>();
  var localProjects = List<LocalProject>.empty(growable: true).obs;
  final box = GetStorage();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    this.localProjects.clear();
    var localProjects = await HiveHelper().queryAllLocalProject();
    if (localProjects.isEmpty) {
      change(HomeState(false), status: RxStatus.empty());
    } else {
      change(HomeState(true), status: RxStatus.success());
    }
    this.localProjects.addAll(localProjects);
  }

  Future<void> deleteAll() async {
    await HiveHelper().deleteAllLocalProject();
  }

  /// 清空账号
  void clearUser() {
    box.remove(TOKEN_SIGN);
  }

}
