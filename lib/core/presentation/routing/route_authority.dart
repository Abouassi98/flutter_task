part of 'app_router.dart';

enum RouteAuthority {
  unauthenticated,
  user;

  // This is helpful when handling different authentication roles (user, admin, etc..).
  static RouteAuthority fromAuthState(Option<User> authState) {
    return authState.match(
      () => RouteAuthority.unauthenticated,
      (user) => RouteAuthority.user,
    );
  }
}
