part of '../app_router.dart';

@TypedGoRoute<SignInRoute>(
  path: '/login',
  routes: [
    TypedGoRoute<RegisterRoute>(
      path: 'register',
    ),
  ],
)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(state.pageKey, const SignInScreen());
}

class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterScreen();
}
