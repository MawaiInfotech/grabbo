// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginOtpModel _$LoginOtpModelFromJson(Map<String, dynamic> json) {
  return _LoginOtpModel.fromJson(json);
}

/// @nodoc
mixin _$LoginOtpModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginOtpModelCopyWith<LoginOtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginOtpModelCopyWith<$Res> {
  factory $LoginOtpModelCopyWith(
          LoginOtpModel value, $Res Function(LoginOtpModel) then) =
      _$LoginOtpModelCopyWithImpl<$Res, LoginOtpModel>;
  @useResult
  $Res call({bool status, String message});
}

/// @nodoc
class _$LoginOtpModelCopyWithImpl<$Res, $Val extends LoginOtpModel>
    implements $LoginOtpModelCopyWith<$Res> {
  _$LoginOtpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginOtpModelImplCopyWith<$Res>
    implements $LoginOtpModelCopyWith<$Res> {
  factory _$$LoginOtpModelImplCopyWith(
          _$LoginOtpModelImpl value, $Res Function(_$LoginOtpModelImpl) then) =
      __$$LoginOtpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message});
}

/// @nodoc
class __$$LoginOtpModelImplCopyWithImpl<$Res>
    extends _$LoginOtpModelCopyWithImpl<$Res, _$LoginOtpModelImpl>
    implements _$$LoginOtpModelImplCopyWith<$Res> {
  __$$LoginOtpModelImplCopyWithImpl(
      _$LoginOtpModelImpl _value, $Res Function(_$LoginOtpModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$LoginOtpModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginOtpModelImpl implements _LoginOtpModel {
  const _$LoginOtpModelImpl({this.status = false, this.message = ""});

  factory _$LoginOtpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginOtpModelImplFromJson(json);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'LoginOtpModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginOtpModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginOtpModelImplCopyWith<_$LoginOtpModelImpl> get copyWith =>
      __$$LoginOtpModelImplCopyWithImpl<_$LoginOtpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginOtpModelImplToJson(
      this,
    );
  }
}

abstract class _LoginOtpModel implements LoginOtpModel {
  const factory _LoginOtpModel({final bool status, final String message}) =
      _$LoginOtpModelImpl;

  factory _LoginOtpModel.fromJson(Map<String, dynamic> json) =
      _$LoginOtpModelImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LoginOtpModelImplCopyWith<_$LoginOtpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
