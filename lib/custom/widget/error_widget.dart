import 'package:flutter/material.dart';

/// 错误页面
class ErrorInnerWidget extends StatelessWidget {
  const ErrorInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("发生了错误"),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  refreshMethod();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
      ],
    ));
  }

  void refreshMethod() {}
}
