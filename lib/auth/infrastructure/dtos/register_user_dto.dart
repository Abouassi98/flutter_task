import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/register_user.dart';
import 'user_dto.dart';

part 'register_user_dto.freezed.dart';

part 'register_user_dto.g.dart';

@freezed
class RegisterUserDto with _$RegisterUserDto {
  const factory RegisterUserDto({
    required UserDto user,
    required String message,
  }) = _RegisterUserDto;
  const RegisterUserDto._();

  factory RegisterUserDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDtoFromJson(json);
  RegisterUser toDomain() {
    return RegisterUser(
      message: message,
      user: user.toDomain(),
    );
  }
}
