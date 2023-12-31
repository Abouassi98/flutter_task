import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../core/presentation/styles/styles.dart';
import '../utils/tab_item.dart';

class HomeShellBottomNavBar extends StatelessWidget {
  const HomeShellBottomNavBar({
    required this.currentTab,
    required this.onSelectTab,
    super.key,
  });

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return PlatformNavBar(
      height: Sizes.navBarHeight60,
      currentIndex: currentTab.index,
      itemChanged: (index) {
        onSelectTab(TabItem.values[index]);
      },
      material3: (_, __) {
        return MaterialNavigationBarData(
          backgroundColor: Colors.white,
          items: TabItem.values
              .map(
                (tabItem) => NavigationDestination(
                  icon: tabItem.getTabItemIcon(context),
                  selectedIcon: tabItem.getTabItemSelectedIcon(context),
                  label: tabItem.getTabItemLabel(context),
                ),
              )
              .toList(),
          elevation: 2,
        );
      },
      cupertino: (_, __) {
        return CupertinoTabBarData(
          items: TabItem.values
              .map(
                (tabItem) => BottomNavigationBarItem(
                  icon: tabItem.getTabItemIcon(context),
                  activeIcon: tabItem.getTabItemSelectedIcon(context),
                  label: tabItem.getTabItemLabel(context),
                ),
              )
              .toList(),
          activeColor: Theme.of(context).colorScheme.primary,
        );
      },
    );
  }
}
