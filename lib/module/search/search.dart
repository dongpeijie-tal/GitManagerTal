import 'package:flutter/material.dart';

/// 搜索界面
class SearchWrapperWidget extends StatelessWidget {
  const SearchWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: '搜索<项目关键字>',
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            child: Text("搜索"),
            onPressed: () {
              // Handle search button press
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
