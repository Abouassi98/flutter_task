import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/token.dart';
part 'token_dto.freezed.dart';
part 'token_dto.g.dart';

@Freezed(toJson: true)
class TokenDto with _$TokenDto {
  const factory TokenDto({
    required String? refresh,
    required String? access,
  }) = _TokenDto;
  const TokenDto._();

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  factory TokenDto.fromDomain(Token? token) {
    return TokenDto(
      access: token?.access,
      refresh: token?.refresh,
    );
  }

  Token toDomain() {
    return Token(
      access: access,
      refresh: refresh,
    );
  }
}
