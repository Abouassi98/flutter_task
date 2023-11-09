import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/sign_in_with_user_name.dart';
import '../../domain/user.dart';
import '../../infrastructure/repos/auth_repo.dart';
import 'auth_state_provider.dart';

part 'sign_in_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class SignInState extends _$SignInState {
  @override
  FutureOr<Option<User>> build() => const None();

  Future<void> signIn(SignInWithUserNameParms params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(authRepoProvider);
      final user = await authRepo.signInWithUserName(params);

      ref.read(authStateProvider.notifier).authenticateUser(user);

      return Some(user);
    });
  }
}
