import 'package:flutter/material.dart';

/// Home页面状态
class HomeState{
  bool hasMore;
  HomeState(this.hasMore);
}

/// 空页面
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// 错误页面
class ErrorInnerWidget extends StatelessWidget {
  const ErrorInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// 进度条页面
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}