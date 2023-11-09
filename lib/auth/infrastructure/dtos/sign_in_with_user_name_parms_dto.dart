import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/sign_in_with_user_name.dart';
part 'sign_in_with_user_name_parms_dto.freezed.dart';

part 'sign_in_with_user_name_parms_dto.g.dart';

@Freezed(toJson: true)
class SignInWithUserNameParmsDto with _$SignInWithUserNameParmsDto {
  const factory SignInWithUserNameParmsDto({
    required String username,
    required String password,
  }) = _SignInWithUserNameParmsDto;

  factory SignInWithUserNameParmsDto.fromDomain(
      SignInWithUserNameParms signInWithEmail,) {
    return SignInWithUserNameParmsDto(
      username: signInWithEmail.userName.value,
      password: signInWithEmail.password.value,
    );
  }
}
