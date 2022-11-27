// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyStatus _$$_VerifyStatusFromJson(Map<String, dynamic> json) =>
    _$_VerifyStatus(
      isEmailVerified: json['isEmailVerified'] as bool,
      isGoogleVerified: json['isGoogleVerified'] as bool,
      isAppleVerified: json['isAppleVerified'] as bool,
    );

Map<String, dynamic> _$$_VerifyStatusToJson(_$_VerifyStatus instance) =>
    <String, dynamic>{
      'isEmailVerified': instance.isEmailVerified,
      'isGoogleVerified': instance.isGoogleVerified,
      'isAppleVerified': instance.isAppleVerified,
    };
