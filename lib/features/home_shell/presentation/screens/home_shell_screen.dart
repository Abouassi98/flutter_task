import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../auth/presentation/providers/sign_out_provider.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/infrastructure/services/connection_stream_service.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/toasts.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_appbar.dart';
import '../../../favourites/infrastructure/data_source/products_local_data_source.dart';
import '../../../favourites/presentation/providers/fetch_fav_favourites_provider.dart';
import '../components/home_shell_appbar.dart';
import '../components/home_shell_bottom_nav_bar.dart';
import '../utils/tab_item.dart';

/// Builds the "shell" for the home by building a Scaffold with a persistent
/// BottomNavigationBar or similar, where [navigationShell] is placed in the body of the Scaffold.
class HomeShellScreen extends HookConsumerWidget {
  const HomeShellScreen({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('HomeShellScreen'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(productsIsarProvider, (_, __) {});
    ref.watch(
      fetchFavProductsProvider,
    );
    ref.listen(connectionStreamProvider, (prevState, newState) {
      newState.whenOrNull(
        data: (status) {
          Toasts.showConnectionToast(context, connectionStatus: status);
        },
      );
    });

    ref.easyListen(signOutStateProvider);

    final selectedTab =
        useState<TabItem>(TabItem.values[navigationShell.currentIndex]);

    void onSelectTab(TabItem tab) {
      selectedTab.value = tab;
      // When navigating to a new branch, it's recommended to use the goBranch
      // method, as doing so makes sure the last navigation state of the
      // Navigator for the branch is restored.
      navigationShell.goBranch(
        tab.index,
        // A common pattern when using bottom navigation bars is to support
        // navigating to the initial location when tapping the item that is
        // already active. This demonstrates how to support this behavior,
        // using the initialLocation parameter of goBranch:
        // initialLocation: tab.index == navigationShell.currentIndex,
      );
    }

    return PopScope(
      canPop: selectedTab.value == TabItem.home,
      onPopInvoked: (_) {
        //This prevent popping when tab isn't (Home) & instead will back to home.
        if (selectedTab.value != TabItem.home) {
          selectedTab.value = TabItem.home;
          navigationShell.goBranch(TabItem.home.index);
        }
      },
      child: Scaffold(
        // Using single persistent AppBar for all tabs and update it according to current location.
        // This is necessary to avoid using nested scaffolds as it's discouraged by flutter
        // (but You can use it anyway if you don't want the persistent AppBar behavior).
        floatingActionButton: FloatingActionButton(
          backgroundColor: customColors(context).orangeColor,
          shape: const CircleBorder(),
          onPressed: () {
            const CartRoute().go(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: [Text('352'), Icon(Icons.shopping_cart)],
            ),
          ),
          //params
        ),
        extendBodyBehindAppBar: navigationShell.isHomeRoute,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: navigationShell.currentLocationHasAppBar
            ? PlatformAppBar(
                toolbarHeight: navigationShell.isHomeRoute
                    ? Sizes.appBarHeight60 * 2
                    : Sizes.appBarHeight60,
                appbar: const HomeShellAppBar(),
              )
            : null,

        body: navigationShell,
        bottomNavigationBar: HomeShellBottomNavBar(
          currentTab: selectedTab.value,
          onSelectTab: onSelectTab,
        ),
        // TODO(ABOUASSI): Migrate to AdaptiveLayout HomeShell when the bottomNavigation displacement
        // bug is fixed: https://github.com/flutter/flutter/issues/131734
        /* body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.standard: SlotLayout.from(
                key: const Key('Body Standard'),
                builder: (_) => navigationShell,
              ),
            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('Bottom Navigation Small'),
                builder: (_) => HomeShellBottomNavBar(
                  currentTab: selectedTab.value,
                  onSelectTab: onSelectTab,
                ),
              ),
            },
          ),
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.medium: SlotLayout.from(
                key: const Key('Primary Navigation Medium'),
                builder: (_) => HomeShellNavigationRail(
                  currentTab: selectedTab.value,
                  onSelectTab: onSelectTab,
                ),
              ),
              Breakpoints.large: SlotLayout.from(
                key: const Key('Primary Navigation Large'),
                builder: (_) => HomeShellNavigationRail(
                  extended: true,
                  currentTab: selectedTab.value,
                  onSelectTab: onSelectTab,
                ),
              ),
            },
          ),
        ), */
      ),
    );
  }
}
