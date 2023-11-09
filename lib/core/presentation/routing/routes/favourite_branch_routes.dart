part of '../app_router.dart';

class FavouritesRoute extends GoRouteData {
  const FavouritesRoute();

  static const routes = [
    TypedGoRoute<FavouritesRoute>(
      path: '/favourites',
      routes: [
        // TypedGoRoute<CartRoute>(
        //   path: 'cart',
        // ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavouriteScreen();
}

// class CartRoute extends GoRouteData {
//   const CartRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) => const CartScreen();
// }
