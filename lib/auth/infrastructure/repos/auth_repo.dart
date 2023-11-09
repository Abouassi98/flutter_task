import '../../../core/infrastructure/network/network_info.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/register_user_parms.dart';
import '../../domain/sign_in_with_user_name.dart';
import '../../domain/user.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../dtos/register_user_parms_dto.dart';
import '../dtos/sign_in_with_user_name_parms_dto.dart';
import '../dtos/user_dto.dart';
part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
}

class AuthRepo {
  AuthRepo({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  Future<User> signInWithUserName(SignInWithUserNameParms params) async {
    final dto = SignInWithUserNameParmsDto.fromDomain(params);
    final tokenDto = await remoteDataSource.signInWithUserName(dto);
    final token = tokenDto.toDomain();
    final user = await getUserData();
    await localDataSource
        .cacheUserData(UserDto.fromDomain(user).copyWith(token: tokenDto));
    return user.copyWith(token: token);
  }

  Future<User> getUserData() async {
    final user = await localDataSource.getUserData();
    return user.toDomain();
  }

  Future<User> registerUser(RegisterUserParms params) async {
    final dto = RegisterUserParmsDto.fromDomain(params);
    final userDto = await remoteDataSource.registerUser(dto);
    await localDataSource.cacheUserData(
      userDto.user,
    );
    await signInWithUserName(
      SignInWithUserNameParms(
        userName: params.username,
        password: params.password,
      ),
    );
    final user = await getUserData();
    return user;
  }

  Future<void> signOut() async {
    return localDataSource.clearUserData();
  }
}
