part of '../app_router.dart';

class CategoriesRoute extends GoRouteData {
  const CategoriesRoute();

  static const routes = [
    TypedGoRoute<CategoriesRoute>(
      path: '/categories',
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CategoriesScreen();
}
