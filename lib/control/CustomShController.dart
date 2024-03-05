import 'package:get/get.dart';

class CustomShController extends GetxController{

  var shList = <String>[].obs;
  var tempSh = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updateSh() {
    shList.add(tempSh.value);
  }

}