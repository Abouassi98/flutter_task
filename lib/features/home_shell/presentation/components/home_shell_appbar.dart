import 'package:flutter/material.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/custom_appbar.dart';
import '../../../../core/presentation/widgets/custom_home_appbar.dart';

class HomeShellAppBar extends StatelessWidget {
  const HomeShellAppBar({super.key});

  static final IList<String> _noAppBarLocations = IListConst([
    const FavouritesRoute().location,
    const HomeDetailsRoute().location,
  ]);

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).routeLocation;
    if (location == const HomeRoute().location) {
      return const CustomHomeAppBar();
    }

    /// categories Tab
    else if (location == const CategoriesRoute().location) {
      return CustomAppBar(
        hasMenuButton: true,
        backgroundColor: Colors.white,
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

    /// cart Tab
    else if (location == const CartRoute().location) {
      return CustomAppBar(
        hasBackButton: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'سلة التسوق',
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

  bool get isHomeRoute {
    final location = shellRouteContext.routerState.routeLocation;
    return location == const HomeRoute().location;
  }
}
