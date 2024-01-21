import 'package:flutter/material.dart';

/// 空页面
class EmptyInnerWidget extends StatelessWidget {
  String? title;
  EmptyInnerWidget({this.title,super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title ?? "什么都没有的空间"),
        const Icon(Icons.dashboard),
      ],
    ));
  }
}
