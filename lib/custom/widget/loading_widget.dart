import 'package:flutter/material.dart';

/// 进度条页面
class LoadingInnerWidget extends StatelessWidget {
  const LoadingInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text("疯狂加载中"),
        ],
      ),
    );
  }
}
