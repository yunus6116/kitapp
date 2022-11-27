// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicUser _$$_PublicUserFromJson(Map<String, dynamic> json) =>
    _$_PublicUser(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      bio: json['bio'] as String?,
      profilePicture: json['profilePicture'] as String?,
      joinedAt: json['joinedAt'] == null
          ? null
          : DateTime.parse(json['joinedAt'] as String),
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
      verifyStatus: json['verifyStatus'] == null
          ? null
          : VerifyStatus.fromJson(json['verifyStatus'] as Map<String, dynamic>),
      isAgreedTerms: json['isAgreedTerms'] as bool?,
    );

Map<String, dynamic> _$$_PublicUserToJson(_$_PublicUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'profilePicture': instance.profilePicture,
      'joinedAt': instance.joinedAt?.toIso8601String(),
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
      'verifyStatus': instance.verifyStatus,
      'isAgreedTerms': instance.isAgreedTerms,
    };
