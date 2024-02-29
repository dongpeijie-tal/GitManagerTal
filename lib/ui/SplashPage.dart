import 'package:fluent_ui/fluent_ui.dart';
import 'package:gitlabtal/route/route_const.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigation();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      content: Container(
        color: theme.micaBackgroundColor,
        child: const Center(
          child: ProgressRing(),
        ),
      ),
    );
  }

  _navigation() {
    final navigator = Navigator.of(context);
    Future.delayed(const Duration(seconds: 2))
        .then((value) => navigator.popAndPushNamed(loginPage));
  }
}
