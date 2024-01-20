
import 'package:get/get.dart';
import 'package:gitlabtal/provider/search_provider.dart';

import '../controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchProvider());
    Get.lazyPut(() => SearchProjectController());
  }
}