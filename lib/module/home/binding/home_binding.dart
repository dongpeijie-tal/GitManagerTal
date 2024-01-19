import 'package:get/get.dart';
import 'package:gitlabtal/provider/user_provider.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());
    Get.lazyPut(() => HomeController());
  }
}
