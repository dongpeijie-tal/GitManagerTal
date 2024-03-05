
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:gitlabtal/module/home/controller/home_controller.dart';

import 'CustomShPage.dart';
import 'RepositoryPage.dart';
import 'SettingPage.dart';

class HomePage extends StatefulWidget{
  final homeController = Get.put(HomeController());

  HomePage({super.key});

  @override
  State<StatefulWidget> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // 列表选项
    List<NavigationPaneItem> items = [
      PaneItem(
        icon: const Icon(FluentIcons.globe),
        title: const Text('代码仓库'),
        body: const RepositoryPage(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.globe_favorite),
        title: const Text('关注仓库'),
        body: const Placeholder(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.power_shell),
        title: const Text('自制脚本'),
        body: CustomShPage(),
      ),
      PaneItemSeparator(),
      PaneItemExpander(
        icon: const Icon(FluentIcons.cube_shape_solid),
        title: const Text('Android'),
        body: const Placeholder(),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.cube_shape),
            title: const Text('网校'),
            body: const Placeholder(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.cube_shape),
            title: const Text('摩比小班'),
            body: const Placeholder(),
          ),
        ],
      ),
    ];

    // 底部选项
    List<NavigationPaneItem> foots = [
      PaneItem(
        icon: const Icon(FluentIcons.settings),
        title: const Text('设置'),
        body: SettingPage(),
      ),
      // PaneItemAction(
      //   icon: const Icon(FluentIcons.add),
      //   title: const Text('Add New Item'),
      //   onTap: () {
      //     // Your Logic to Add New `NavigationPaneItem`
      //     items.add(
      //       PaneItem(
      //         icon: const Icon(FluentIcons.new_folder),
      //         title: const Text('New Item'),
      //         body: const Center(
      //           child: Text(
      //             'This is a newly added Item',
      //           ),
      //         ),
      //       ),
      //     );
      //     setState(() {});
      //   },
      // ),
    ];
    return NavigationView(
      appBar: const NavigationAppBar(
        automaticallyImplyLeading: false, // 导航按键
        title: Text('你好帅比！',style: TextStyle(fontSize: 20),),
      ),
      pane: NavigationPane(
        selected: widget.homeController.selectPage,
        onChanged: (index) => setState(() => widget.homeController.selectPage = index),
        displayMode: PaneDisplayMode.compact,
        items: items,
        footerItems: foots,
      ),
    );
  }

}



