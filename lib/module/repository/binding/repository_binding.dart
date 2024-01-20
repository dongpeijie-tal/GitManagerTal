import 'package:get/get.dart';
import '../../../provider/repository_provider.dart';
import '../controller/repository_controller.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepositoryProvider());
    Get.lazyPut(() => RepositoryController());
  }
}
