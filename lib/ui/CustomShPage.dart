import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../control/CustomShController.dart';

class CustomShPage extends StatelessWidget {
  final control = Get.put(CustomShController());

  CustomShPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: IconButton(
          icon: const Icon(FluentIcons.add),
          onPressed: () => _createCustomSh(context)),
      children: [
        Obx(
          () => ListView.builder(
            itemCount: control.shList.length,
            itemBuilder: (context, index) {
              final contact = control.shList[index];
              return ListTile(
                title: Text(contact),
                trailing: Button(
                  child: const Text("执行"),
                  onPressed: () => {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _createCustomSh(BuildContext context) async {
    var result = await showDialog<bool>(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('请输入要创建的脚本内容'),
        content:
            TextBox(maxLines: null, onChanged: (s) => control.tempSh.value = s),
        actions: [
          Button(
            child: const Text('取消'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          FilledButton(
            child: const Text('添加'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
    if (result == true) {
      control.updateSh();
    }
  }

  _sh(String s) {}
}
