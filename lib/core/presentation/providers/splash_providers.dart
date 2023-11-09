import '../../../auth/presentation/providers/check_auth_provider.dart';
import '../../core_features/locale/presentation/providers/app_locale_provider.dart';
import '../../core_features/theme/presentation/providers/app_theme_provider.dart';
import '../../infrastructure/error/app_exception.dart';
import '../extensions/future_extensions.dart';
import '../routing/app_router.dart';
import '../utils/riverpod_framework.dart';

part 'splash_providers.g.dart';

@riverpod
Future<void> splashServicesWarmup(SplashServicesWarmupRef ref) async {
  final min =
      Future<void>.delayed(const Duration(seconds: 1)); //Min Time of splash
  final s1 = ref.watch(appThemeControllerProvider.future).suppressError();
  final s2 = ref.watch(appLocaleControllerProvider.future).suppressError();
  final s3 = ref.watch(checkAuthProvider.future).suppressError(
        shouldSuppressError: (e) =>
            e is AppException && e.type == ServerExceptionType.unauthorized,
      );
  await [min, s1, s2, s3].wait.throwAllErrors();
}

@riverpod
Future<String> splashTarget(SplashTargetRef ref) async {
  return const SignInRoute().location;
  /* final hasConnection = await ref.watch(networkInfoProvider).hasInternetConnection;
  if (hasConnection) {
    return const SignInRoute().location;
  } else {
    return const NoInternetRoute().location;
  } */
}
