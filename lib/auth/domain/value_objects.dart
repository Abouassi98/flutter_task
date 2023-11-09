import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/value_validators.dart';

part 'value_objects.freezed.dart';

@freezed
class UserName with _$UserName {
  const factory UserName({
    required String value,
  }) = _UserName;

  static FormFieldValidator<String?> validatevalidateUsername(
          BuildContext context,) =>
      ValueValidators.validateUsername(context);
}

@freezed
class Password with _$Password {
  const factory Password({
    required String value,
  }) = _Password;

  static FormFieldValidator<String?> validateLoginPassword(
    BuildContext context,
  ) =>
      ValueValidators.validateLoginPassword(context);

  static FormFieldValidator<String?> validateCreatePassword(
    BuildContext context,
  ) =>
      ValueValidators.validateCreatePassword(context);

  static String? validateConfirmPassword(
    BuildContext context,
    String password,
    String? confirmPassword,
  ) =>
      ValueValidators.validateConfirmPassword(
        context,
        password,
        confirmPassword,
      );
}
