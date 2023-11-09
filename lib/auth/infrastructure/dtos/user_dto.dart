import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/user.dart';
import 'token_dto.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    @JsonKey(name: 'username') required String username,
    required String email,
    @JsonKey(name: 'last_login') required String? lastLogin,
    @JsonKey(name: 'is_superuser') required bool isSuperuser,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'is_staff') required bool isStaff,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'date_joined') required DateTime dateJoined,
    required List<dynamic> groups,
    @JsonKey(name: 'user_permissions') required List<dynamic> userPermissions,
    required TokenDto? token,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromDomain(User user) {
    return UserDto(
      email: user.email,
      dateJoined: user.dateJoined,
      firstName: user.firstName,
      groups: user.groups,
      id: user.id,
      isActive: user.isActive,
      isStaff: user.isStaff,
      isSuperuser: user.isSuperuser,
      lastLogin: user.lastLogin,
      lastName: user.lastName,
      userPermissions: user.userPermissions,
      username: user.username,
      token: TokenDto.fromDomain(user.token),
    );
  }

  User toDomain() {
    return User(
      email: email,
      username: username,
      dateJoined: dateJoined,
      firstName: firstName,
      groups: groups,
      id: id,
      isActive: isActive,
      isStaff: isStaff,
      isSuperuser: isSuperuser,
      lastLogin: lastLogin,
      lastName: lastName,
      userPermissions: userPermissions,
      token: token?.toDomain(),
    );
  }
}
