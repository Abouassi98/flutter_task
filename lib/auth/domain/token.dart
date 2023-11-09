import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String? refresh,
    required String? access,
  }) = _Token;
  const Token._();
}
