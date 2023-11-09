import 'user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user.freezed.dart';

@freezed
class RegisterUser with _$RegisterUser {
  const factory RegisterUser({
    required User user,
    required String message,
  }) = _RegisterUserParms;
}
