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
    return const Center(
      child:
        Column(
          children: [
            Text("什么都没有的空间"),
            Icon(Icons.dashboard),
          ],
        )
    );
  }
}

/// 错误页面
class ErrorInnerWidget extends StatelessWidget {
  const ErrorInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Column(
          children: [
            const Text("发生了错误"),
            Row(children: [
              IconButton(onPressed: (){
                refreshMethod();
              }, icon: const Icon(Icons.refresh))
            ],),
          ],
        )
    );
  }

  void refreshMethod(){

  }
}

/// 进度条页面
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text("疯狂加载中"),
        ],
      ),
    );
  }
}