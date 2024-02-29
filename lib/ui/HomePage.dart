

import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    List<NavigationPaneItem> items = [
      PaneItem(
        icon: const Icon(FluentIcons.home),
        title: const Text('Home'),
        body: const Placeholder(),
      ),
      PaneItemSeparator(),
      PaneItem(
        icon: const Icon(FluentIcons.issue_tracking),
        title: const Text('Track orders'),
        infoBadge: const InfoBadge(source: Text('8')),
        body: const Placeholder(),
      ),
      PaneItemExpander(
        icon: const Icon(FluentIcons.account_management),
        title: const Text('Account'),
        body: const Placeholder(),
        items: [
          PaneItemHeader(header: const Text('Apps')),
          PaneItem(
            icon: const Icon(FluentIcons.mail),
            title: const Text('Mail'),
            body: const Placeholder(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.calendar),
            title: const Text('Calendar'),
            body: const Placeholder(),
          ),
        ],
      ),
    ];

    return NavigationView(
      appBar: const NavigationAppBar(
        title: Text('NavigationView'),
      ),
      pane: NavigationPane(
        selected: 0,
        onChanged: (index) => setState(() => 0),
        displayMode: PaneDisplayMode.auto,
        items: items,
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
            body: const Placeholder(),
          ),
          PaneItemAction(
            icon: const Icon(FluentIcons.add),
            title: const Text('Add New Item'),
            onTap: () {
              // Your Logic to Add New `NavigationPaneItem`
              items.add(
                PaneItem(
                  icon: const Icon(FluentIcons.new_folder),
                  title: const Text('New Item'),
                  body: const Center(
                    child: Text(
                      'This is a newly added Item',
                    ),
                  ),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

}



