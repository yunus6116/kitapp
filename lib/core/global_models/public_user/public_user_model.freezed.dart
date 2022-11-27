// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'public_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicUser _$PublicUserFromJson(Map<String, dynamic> json) {
  return _PublicUser.fromJson(json);
}

/// @nodoc
mixin _$PublicUser {
  String? get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  DateTime? get joinedAt => throw _privateConstructorUsedError;
  DateTime? get modifiedAt => throw _privateConstructorUsedError;
  VerifyStatus? get verifyStatus => throw _privateConstructorUsedError;
  bool? get isAgreedTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicUserCopyWith<PublicUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicUserCopyWith<$Res> {
  factory $PublicUserCopyWith(
          PublicUser value, $Res Function(PublicUser) then) =
      _$PublicUserCopyWithImpl<$Res, PublicUser>;
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String? username,
      String? phone,
      String? firstName,
      String? lastName,
      String? bio,
      String? profilePicture,
      DateTime? joinedAt,
      DateTime? modifiedAt,
      VerifyStatus? verifyStatus,
      bool? isAgreedTerms});

  $VerifyStatusCopyWith<$Res>? get verifyStatus;
}

/// @nodoc
class _$PublicUserCopyWithImpl<$Res, $Val extends PublicUser>
    implements $PublicUserCopyWith<$Res> {
  _$PublicUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? bio = freezed,
    Object? profilePicture = freezed,
    Object? joinedAt = freezed,
    Object? modifiedAt = freezed,
    Object? verifyStatus = freezed,
    Object? isAgreedTerms = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as VerifyStatus?,
      isAgreedTerms: freezed == isAgreedTerms
          ? _value.isAgreedTerms
          : isAgreedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerifyStatusCopyWith<$Res>? get verifyStatus {
    if (_value.verifyStatus == null) {
      return null;
    }

    return $VerifyStatusCopyWith<$Res>(_value.verifyStatus!, (value) {
      return _then(_value.copyWith(verifyStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PublicUserCopyWith<$Res>
    implements $PublicUserCopyWith<$Res> {
  factory _$$_PublicUserCopyWith(
          _$_PublicUser value, $Res Function(_$_PublicUser) then) =
      __$$_PublicUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String? username,
      String? phone,
      String? firstName,
      String? lastName,
      String? bio,
      String? profilePicture,
      DateTime? joinedAt,
      DateTime? modifiedAt,
      VerifyStatus? verifyStatus,
      bool? isAgreedTerms});

  @override
  $VerifyStatusCopyWith<$Res>? get verifyStatus;
}

/// @nodoc
class __$$_PublicUserCopyWithImpl<$Res>
    extends _$PublicUserCopyWithImpl<$Res, _$_PublicUser>
    implements _$$_PublicUserCopyWith<$Res> {
  __$$_PublicUserCopyWithImpl(
      _$_PublicUser _value, $Res Function(_$_PublicUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? phone = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? bio = freezed,
    Object? profilePicture = freezed,
    Object? joinedAt = freezed,
    Object? modifiedAt = freezed,
    Object? verifyStatus = freezed,
    Object? isAgreedTerms = freezed,
  }) {
    return _then(_$_PublicUser(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      verifyStatus: freezed == verifyStatus
          ? _value.verifyStatus
          : verifyStatus // ignore: cast_nullable_to_non_nullable
              as VerifyStatus?,
      isAgreedTerms: freezed == isAgreedTerms
          ? _value.isAgreedTerms
          : isAgreedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicUser implements _PublicUser {
  const _$_PublicUser(
      {required this.uid,
      required this.email,
      required this.username,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.bio,
      required this.profilePicture,
      required this.joinedAt,
      required this.modifiedAt,
      required this.verifyStatus,
      required this.isAgreedTerms});

  factory _$_PublicUser.fromJson(Map<String, dynamic> json) =>
      _$$_PublicUserFromJson(json);

  @override
  final String? uid;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? phone;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? bio;
  @override
  final String? profilePicture;
  @override
  final DateTime? joinedAt;
  @override
  final DateTime? modifiedAt;
  @override
  final VerifyStatus? verifyStatus;
  @override
  final bool? isAgreedTerms;

  @override
  String toString() {
    return 'PublicUser(uid: $uid, email: $email, username: $username, phone: $phone, firstName: $firstName, lastName: $lastName, bio: $bio, profilePicture: $profilePicture, joinedAt: $joinedAt, modifiedAt: $modifiedAt, verifyStatus: $verifyStatus, isAgreedTerms: $isAgreedTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.isAgreedTerms, isAgreedTerms) ||
                other.isAgreedTerms == isAgreedTerms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      username,
      phone,
      firstName,
      lastName,
      bio,
      profilePicture,
      joinedAt,
      modifiedAt,
      verifyStatus,
      isAgreedTerms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicUserCopyWith<_$_PublicUser> get copyWith =>
      __$$_PublicUserCopyWithImpl<_$_PublicUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicUserToJson(
      this,
    );
  }
}

abstract class _PublicUser implements PublicUser {
  const factory _PublicUser(
      {required final String? uid,
      required final String? email,
      required final String? username,
      required final String? phone,
      required final String? firstName,
      required final String? lastName,
      required final String? bio,
      required final String? profilePicture,
      required final DateTime? joinedAt,
      required final DateTime? modifiedAt,
      required final VerifyStatus? verifyStatus,
      required final bool? isAgreedTerms}) = _$_PublicUser;

  factory _PublicUser.fromJson(Map<String, dynamic> json) =
      _$_PublicUser.fromJson;

  @override
  String? get uid;
  @override
  String? get email;
  @override
  String? get username;
  @override
  String? get phone;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get bio;
  @override
  String? get profilePicture;
  @override
  DateTime? get joinedAt;
  @override
  DateTime? get modifiedAt;
  @override
  VerifyStatus? get verifyStatus;
  @override
  bool? get isAgreedTerms;
  @override
  @JsonKey(ignore: true)
  _$$_PublicUserCopyWith<_$_PublicUser> get copyWith =>
      throw _privateConstructorUsedError;
}
