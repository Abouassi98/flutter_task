import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/register_user_parms.dart';
import '../../domain/user.dart';
import '../../infrastructure/repos/auth_repo.dart';
import 'auth_state_provider.dart';

part 'register_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class RegisterState extends _$RegisterState {
  @override
  FutureOr<Option<User>> build() => const None();

  Future<void> register(RegisterUserParms params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(authRepoProvider);
      await authRepo.registerUser(params);
      final user = await authRepo.getUserData();
      ref.read(authStateProvider.notifier).authenticateUser(user);
      return Some(user);
    });
  }
}
