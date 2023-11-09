import 'package:flutter/material.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_icons.dart';

enum TabItem {
  home,
  cateogries,
  favourites,
  profile;

  const TabItem();

  Widget getTabItemIcon(BuildContext context) {
    return _getTabIcon(context, _getTabIconData(context));
  }

  Widget getTabItemSelectedIcon(BuildContext context) {
    return _getTabIcon(context, _getTabIconData(context), isSelected: true);
  }

  IconData _getTabIconData(BuildContext context) {
    return switch (this) {
      TabItem.home => AppPlatformIcons.platformIcons(context).home,
      TabItem.cateogries => Icons.category,
      TabItem.favourites =>
        AppPlatformIcons.platformIcons(context).favoriteSolid,
      TabItem.profile => AppPlatformIcons.platformIcons(context).personSolid,
    };
  }

  Widget _getTabIcon(
    BuildContext context,
    IconData? icon, {
    bool isSelected = false,
  }) {
    return Icon(
      icon,
      size: Sizes.navBarIconR22,
      color: isSelected ? Theme.of(context).colorScheme.primary : null,
    );
  }

  String getTabItemLabel(BuildContext context) {
    return switch (this) {
      TabItem.home => 'الرئيسية',
      TabItem.cateogries => 'الأقسام',
      TabItem.favourites => 'المفضلة',
      TabItem.profile => 'الحساب',
    };
  }
}
