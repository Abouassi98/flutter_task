import 'value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_with_user_name.freezed.dart';

@freezed
class SignInWithUserNameParms with _$SignInWithUserNameParms {
  const factory SignInWithUserNameParms({
    required UserName userName,
    required Password password,
  }) = _SignInWithUserNameParms;
}
