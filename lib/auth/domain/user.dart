import 'package:freezed_annotation/freezed_annotation.dart';

import 'token.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    required String? lastLogin,
    required bool isSuperuser,
    required String firstName,
    required String lastName,
    required bool isStaff,
    required bool isActive,
    required DateTime dateJoined,
    required Token? token,
    required List<dynamic> groups,
    required List<dynamic> userPermissions,
  }) = _User;
  const User._();

  /* User copyWithProfileDetails(ProfileDetails profileDetails) {
    return copyWith(
      name: profileDetails.name,
      phone: profileDetails.phone,
    );
  } */
}
