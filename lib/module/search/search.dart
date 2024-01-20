import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/search_controller.dart';

/// 搜索界面
class SearchWrapperWidget extends StatelessWidget {
  SearchWrapperWidget({super.key});
  SearchProjectController controller = Get.find();
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(
            hintText: '搜索<项目关键字>',
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            child: Text("搜索",style: Theme.of(context).textTheme.labelMedium,),
            onPressed: () {
              controller.searchProject(textFieldController.text);
            },
          ),
        ],
      ),
      body: SearchWidget(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
