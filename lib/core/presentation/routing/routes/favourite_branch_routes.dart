part of '../app_router.dart';

class FavouritesRoute extends GoRouteData {
  const FavouritesRoute();

  static const routes = [
    TypedGoRoute<FavouritesRoute>(
      path: '/favourites',
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavouriteScreen();
}
