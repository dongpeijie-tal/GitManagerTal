
import 'package:get/get.dart';
import 'package:gitlabtal/module/setting/controller/setting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}