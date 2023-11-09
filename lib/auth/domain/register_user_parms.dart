import 'package:flutter/cupertino.dart';

import '../../core/domain/value_validators.dart';
import 'value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_parms.freezed.dart';

@freezed
class RegisterUserParms with _$RegisterUserParms {
  const factory RegisterUserParms({
    required String email,
    required Password password,
    required UserName username,
    required String firstName,
    required String lastName,
  }) = _RegisterUserParms;

  static FormFieldValidator<String?> validateEmail(
    BuildContext context,
  ) =>
      ValueValidators.validateEmail(context);

  static FormFieldValidator<String?> validateUsername(BuildContext context) =>
      ValueValidators.validateUsername(context);
  static FormFieldValidator<String?> validateSingleName(BuildContext context) =>
      ValueValidators.validateSingleName(context);
}
