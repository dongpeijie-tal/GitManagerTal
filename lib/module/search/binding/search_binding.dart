
import 'package:get/get.dart';
import 'package:gitlabtal/module/search/controller/search_controller.dart';
import 'package:gitlabtal/provider/search_provider.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchProvider());
    Get.lazyPut(() => SearchController());
  }
}