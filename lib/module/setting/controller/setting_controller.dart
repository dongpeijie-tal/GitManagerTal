
import 'package:get/get.dart';

class SettingController extends GetxController{

  var darkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  changeMode(bool isDarkMode) {
    darkMode.value = isDarkMode;
  }

  logout() {

  }
}