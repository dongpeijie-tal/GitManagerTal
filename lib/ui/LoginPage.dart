import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/route/route_const.dart';

import 'login/LoginController.dart';

class LoginPage extends StatefulWidget {
  final loginController = Get.put(LoginController());
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      content: Container(
        color: theme.micaBackgroundColor,
        child: SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InfoLabel(
                    label: "你希望本次登录的昵称？",
                    child: TextBox(
                      placeholder: 'coder',
                      controller: _usernameController,
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  InfoLabel(
                    label: "请输入你的Git private-token",
                    child: PasswordBox(
                      revealMode: PasswordRevealMode.hidden,
                      placeholder: 'private-toke',
                      controller: _passwordController,
                    ),
                  ),
                  const SizedBox(height: 38.0),
                  Button(
                    child: const Text('进入'),
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(homePage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
