import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/setting/controller/setting_controller.dart';

class SettingPage extends StatelessWidget {
  SettingController control = Get.find();

  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _uiSettingTitleWidget("界面设置"),
          _darkModeWidget(),
          _uiSettingTitleWidget("用户设置"),
          _userClearWidget(),
        ],
      ),
    );
  }

  /// 设置标题
  _uiSettingTitleWidget(String title, {String? desc}) => Padding(
      padding: const EdgeInsets.fromLTRB(28.0, 10.0, 28.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          const SizedBox(
            height: 3,
          ),
          Visibility(
            visible: desc != null ? true : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(desc ?? ""),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          )
        ],
      ));

  /// 黑暗模式
  _darkModeWidget() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withAlpha(50), width: 1.0),
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: ListTile(
            trailing: Obx(() => ToggleSwitch(
                  checked: control.darkMode.value,
                  onChanged: (r) => control.changeMode(r),
                )),
            leading: const Icon(FluentIcons.light),
            title: const Text("黑暗模式"),
            subtitle: const Text("更改应用为黑暗模式")),
      );

  /// 清除用户信息
  _userClearWidget() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withAlpha(50), width: 1.0),
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8.0))),
    child: ListTile(
        leading: const Icon(FluentIcons.sign_out),
        trailing: Button(onPressed: ()=>control.logout(),child: const Text("退出")),
        title: const Text("退出登录"),
        subtitle: const Text("退出当前登录，会清除您的private-token以及相关关注仓库信息")),
  );
}