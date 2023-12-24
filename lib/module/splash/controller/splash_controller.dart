import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gitlabtal/top/bean/top_const.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  var token = "".obs;

  @override
  void onInit() async {
    super.onInit();
  }

  // 存储数据
  void putUserToken(String value) {
    saveUserToken(value);
    token.value = value;
  }

  // 获取数据
  String getUserToken() {
    String value = box.read(TOKEN_SIGN);
    token.value = value;
    return value;
  }

  void saveUserToken(String value) {
    box.write(TOKEN_SIGN, value);
  }

}
