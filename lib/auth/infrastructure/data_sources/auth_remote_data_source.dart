import 'dart:convert';
import '../../../core/infrastructure/network/main_api/api_callers/main_api_facade.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../dtos/register_user_dto.dart';
import '../dtos/register_user_parms_dto.dart';
import '../dtos/sign_in_with_user_name_parms_dto.dart';
import '../dtos/token_dto.dart';

part 'auth_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(
    ref,
    mainApiFacade: ref.watch(mainApiFacadeProvider),
  );
}

class AuthRemoteDataSource {
  AuthRemoteDataSource(
    this.ref, {
    required this.mainApiFacade,
  });

  final AuthRemoteDataSourceRef ref;
  final MainApiFacade mainApiFacade;

  static const String signInPath = '/users/login/';

  static const String registerPath = '/users/register/';

  Future<TokenDto> signInWithUserName(SignInWithUserNameParmsDto params) async {
    final response = await mainApiFacade.postData<Map<String, dynamic>>(
      path: signInPath,
      data: json.encode(params.toJson()),
    );

    return TokenDto.fromJson(response.data!);
  }

  Future<RegisterUserDto> registerUser(RegisterUserParmsDto params) async {
    final response = await mainApiFacade.postData<Map<String, dynamic>>(
      path: registerPath,
      data: json.encode(params.toJson()),
    );

    return RegisterUserDto.fromJson(response.data!);
  }
}
