part of '../app_router.dart';

class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const routes = [
    TypedGoRoute<HomeRoute>(
      path: '/home',
      routes: [
        TypedGoRoute<HomeDetailsRoute>(
          path: 'home_details',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class HomeDetailsRoute extends GoRouteData {
  const HomeDetailsRoute({this.$extra});
  final Product? $extra;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        state.pageKey,
        HomeDetailsScreen(
          product: $extra!,
        ),
      );
}
