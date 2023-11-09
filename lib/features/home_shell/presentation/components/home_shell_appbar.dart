import 'package:flutter/material.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/custom_appbar.dart';

class HomeShellAppBar extends StatelessWidget {
  const HomeShellAppBar({super.key});

  static final IList<String> _noAppBarLocations = IListConst([
    const FavouritesRoute().location,
  ]);

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).routeLocation;

    /// categories Tab
    if (location == const CategoriesRoute().location) {
      return CustomAppBar(
        hasMenuButton: true,
        centerTitle: true,
        title: Text(
          'التصنيفات',
          style: TextStyles.f14(context),
        ),
        trailingActions: [
          Container(
            width: Sizes.appBarLeadingWidth,
            alignment: Alignment.center,
            child: const Icon(Icons.search, color: Colors.grey),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}

extension StatefulNavigationShellX on StatefulNavigationShell {
  bool get currentLocationHasAppBar {
    final location = shellRouteContext.routerState.routeLocation;
    return !HomeShellAppBar._noAppBarLocations.contains(location);
  }
}
