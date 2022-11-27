import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitapp/core/global_models/public_user/verify_status_model.dart';

part 'public_user_model.freezed.dart';
part 'public_user_model.g.dart';

@freezed
class PublicUser with _$PublicUser {
  const factory PublicUser({
    required String? uid,
    required String? email,
    required String? username,
    required String? phone,
    required String? firstName,
    required String? lastName,
    required String? bio,
    required String? profilePicture,
    required DateTime? joinedAt,
    required DateTime? modifiedAt,
    required VerifyStatus? verifyStatus,
    required bool? isAgreedTerms,
  }) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
}
