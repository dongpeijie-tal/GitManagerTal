import 'package:fluent_ui/fluent_ui.dart';

/// 进度条页面
class LoadingInnerWidget extends StatelessWidget {
  const LoadingInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProgressRing(),
          const SizedBox(height: 10),
          Text("疯狂加载中",style: FluentTheme.of(context).typography.body,),
        ],
      ),
    );
  }
}
