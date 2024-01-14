import 'package:flutter/material.dart';

/// 空页面
class EmptyInnerWidget extends StatelessWidget {
  const EmptyInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("什么都没有的空间"),
        Icon(Icons.dashboard),
      ],
    ));
  }
}
