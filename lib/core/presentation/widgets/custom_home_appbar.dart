import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../features/home/presentation/components/search_widget.dart';
import '../styles/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          // This is helpful for adding symmetric padding for the whole appbar.
          padding: EdgeInsets.zero,
          child: AppBar(
            leadingWidth: Sizes.appBarLeadingWidth,
            automaticallyImplyLeading: false,
            title: Text(
              'الرئيسية',
              style: TextStyles.f14(context),
            ),
            leading: const CustomMenuButton(),
            centerTitle: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Padding(
                padding: EdgeInsets.all(Sizes.marginV16),
                child: SearchComponent(),
              ),
            ),
            systemOverlayStyle:
                Theme.of(context).appBarTheme.systemOverlayStyle,
          ),
        ),
      ),
    );
  }
}

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu_rounded,
        size: Sizes.appBarButtonR32,
      ),
      constraints: const BoxConstraints(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
