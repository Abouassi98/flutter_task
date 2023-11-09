import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/register_user_parms.dart';

part 'register_user_parms_dto.freezed.dart';

part 'register_user_parms_dto.g.dart';

@Freezed(toJson: true)
class RegisterUserParmsDto with _$RegisterUserParmsDto {
  const factory RegisterUserParmsDto({
    required String email,
    required String password,
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
  }) = _RegisterUserParmsDto;

  factory RegisterUserParmsDto.fromDomain(RegisterUserParms registerUser) {
    return RegisterUserParmsDto(
      email: registerUser.email,
      password: registerUser.password.value,
      firstName: registerUser.firstName,
      lastName: registerUser.lastName,
      username: registerUser.username.value,
    );
  }
}
