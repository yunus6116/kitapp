import 'dart:convert';

class VerifyStatus {
  bool isEmailVerified;

  VerifyStatus({
    this.isEmailVerified = false,
  });

  VerifyStatus copyWith({
    bool? isEmailVerified,
  }) {
    return VerifyStatus(
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isEmailVerified': isEmailVerified,
    };
  }

  factory VerifyStatus.fromMap(Map<String, dynamic> map) {
    return VerifyStatus(
      isEmailVerified: map['is_email_verified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyStatus.fromJson(String source) =>
      VerifyStatus.fromMap(json.decode(source));

  @override
  String toString() => 'VerifyStatus(isEmailVerified: $isEmailVerified)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerifyStatus && other.isEmailVerified == isEmailVerified;
  }

  @override
  int get hashCode => isEmailVerified.hashCode;
}
