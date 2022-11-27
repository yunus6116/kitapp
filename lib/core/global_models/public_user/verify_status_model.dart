import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_status_model.freezed.dart';
part 'verify_status_model.g.dart';

@freezed
class VerifyStatus with _$VerifyStatus {
  const factory VerifyStatus({
    required bool isEmailVerified,
    required bool isGoogleVerified,
    required bool isAppleVerified,
  }) = _VerifyStatus;

  factory VerifyStatus.fromJson(Map<String, dynamic> json) =>
      _$VerifyStatusFromJson(json);
}
