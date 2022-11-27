// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verify_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyStatus _$VerifyStatusFromJson(Map<String, dynamic> json) {
  return _VerifyStatus.fromJson(json);
}

/// @nodoc
mixin _$VerifyStatus {
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isGoogleVerified => throw _privateConstructorUsedError;
  bool get isAppleVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyStatusCopyWith<VerifyStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyStatusCopyWith<$Res> {
  factory $VerifyStatusCopyWith(
          VerifyStatus value, $Res Function(VerifyStatus) then) =
      _$VerifyStatusCopyWithImpl<$Res, VerifyStatus>;
  @useResult
  $Res call(
      {bool isEmailVerified, bool isGoogleVerified, bool isAppleVerified});
}

/// @nodoc
class _$VerifyStatusCopyWithImpl<$Res, $Val extends VerifyStatus>
    implements $VerifyStatusCopyWith<$Res> {
  _$VerifyStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerified = null,
    Object? isGoogleVerified = null,
    Object? isAppleVerified = null,
  }) {
    return _then(_value.copyWith(
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoogleVerified: null == isGoogleVerified
          ? _value.isGoogleVerified
          : isGoogleVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppleVerified: null == isAppleVerified
          ? _value.isAppleVerified
          : isAppleVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyStatusCopyWith<$Res>
    implements $VerifyStatusCopyWith<$Res> {
  factory _$$_VerifyStatusCopyWith(
          _$_VerifyStatus value, $Res Function(_$_VerifyStatus) then) =
      __$$_VerifyStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEmailVerified, bool isGoogleVerified, bool isAppleVerified});
}

/// @nodoc
class __$$_VerifyStatusCopyWithImpl<$Res>
    extends _$VerifyStatusCopyWithImpl<$Res, _$_VerifyStatus>
    implements _$$_VerifyStatusCopyWith<$Res> {
  __$$_VerifyStatusCopyWithImpl(
      _$_VerifyStatus _value, $Res Function(_$_VerifyStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerified = null,
    Object? isGoogleVerified = null,
    Object? isAppleVerified = null,
  }) {
    return _then(_$_VerifyStatus(
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoogleVerified: null == isGoogleVerified
          ? _value.isGoogleVerified
          : isGoogleVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppleVerified: null == isAppleVerified
          ? _value.isAppleVerified
          : isAppleVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyStatus implements _VerifyStatus {
  const _$_VerifyStatus(
      {required this.isEmailVerified,
      required this.isGoogleVerified,
      required this.isAppleVerified});

  factory _$_VerifyStatus.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyStatusFromJson(json);

  @override
  final bool isEmailVerified;
  @override
  final bool isGoogleVerified;
  @override
  final bool isAppleVerified;

  @override
  String toString() {
    return 'VerifyStatus(isEmailVerified: $isEmailVerified, isGoogleVerified: $isGoogleVerified, isAppleVerified: $isAppleVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyStatus &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isGoogleVerified, isGoogleVerified) ||
                other.isGoogleVerified == isGoogleVerified) &&
            (identical(other.isAppleVerified, isAppleVerified) ||
                other.isAppleVerified == isAppleVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isEmailVerified, isGoogleVerified, isAppleVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyStatusCopyWith<_$_VerifyStatus> get copyWith =>
      __$$_VerifyStatusCopyWithImpl<_$_VerifyStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyStatusToJson(
      this,
    );
  }
}

abstract class _VerifyStatus implements VerifyStatus {
  const factory _VerifyStatus(
      {required final bool isEmailVerified,
      required final bool isGoogleVerified,
      required final bool isAppleVerified}) = _$_VerifyStatus;

  factory _VerifyStatus.fromJson(Map<String, dynamic> json) =
      _$_VerifyStatus.fromJson;

  @override
  bool get isEmailVerified;
  @override
  bool get isGoogleVerified;
  @override
  bool get isAppleVerified;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyStatusCopyWith<_$_VerifyStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
