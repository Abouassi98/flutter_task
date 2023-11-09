part of 'app_router.dart';

extension GoRouterStateX on GoRouterState {
  // TODO(ABOUASSI): Use routeLocation when https://github.com/flutter/flutter/issues/125752 is fixed?
  String get routeLocation => uri.toString();

  List<RouteAuthority> get routeAuthority {
    const defaultAuthority = [
      RouteAuthority.user,
    ];

    final publicRoutes = [
      const SplashRoute().location,
      const NoInternetRoute().location,
    ];
    if (publicRoutes.any(routeLocation.startsWith)) {
      return RouteAuthority.values;
    }

    final unauthenticatedRoutes = [
      const SignInRoute().location,
      const RegisterRoute().location,
    ];
    if (unauthenticatedRoutes.any(routeLocation.startsWith)) {
      return const [RouteAuthority.unauthenticated];
    }

    final homeRoutes = [
      const HomeRoute().location,
      const CategoriesRoute().location,
      const FavouritesRoute().location,
    ];
    if (homeRoutes.any(routeLocation.startsWith)) {
      return defaultAuthority;
    }

    throw UnimplementedError('Route $uri has not set routeAuthority.');
  }
}
