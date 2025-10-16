// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_tabs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CatTabsModel _$CatTabsModelFromJson(Map<String, dynamic> json) {
  return _CatTabsModel.fromJson(json);
}

/// @nodoc
mixin _$CatTabsModel {
  @JsonKey(name: "category_code")
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "category_icon")
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatTabsModelCopyWith<CatTabsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatTabsModelCopyWith<$Res> {
  factory $CatTabsModelCopyWith(
          CatTabsModel value, $Res Function(CatTabsModel) then) =
      _$CatTabsModelCopyWithImpl<$Res, CatTabsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "category_code") String code,
      @JsonKey(name: "category_name") String name,
      @JsonKey(name: "category_icon") String icon});
}

/// @nodoc
class _$CatTabsModelCopyWithImpl<$Res, $Val extends CatTabsModel>
    implements $CatTabsModelCopyWith<$Res> {
  _$CatTabsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatTabsModelImplCopyWith<$Res>
    implements $CatTabsModelCopyWith<$Res> {
  factory _$$CatTabsModelImplCopyWith(
          _$CatTabsModelImpl value, $Res Function(_$CatTabsModelImpl) then) =
      __$$CatTabsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "category_code") String code,
      @JsonKey(name: "category_name") String name,
      @JsonKey(name: "category_icon") String icon});
}

/// @nodoc
class __$$CatTabsModelImplCopyWithImpl<$Res>
    extends _$CatTabsModelCopyWithImpl<$Res, _$CatTabsModelImpl>
    implements _$$CatTabsModelImplCopyWith<$Res> {
  __$$CatTabsModelImplCopyWithImpl(
      _$CatTabsModelImpl _value, $Res Function(_$CatTabsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_$CatTabsModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatTabsModelImpl implements _CatTabsModel {
  const _$CatTabsModelImpl(
      {@JsonKey(name: "category_code") this.code = "",
      @JsonKey(name: "category_name") this.name = "",
      @JsonKey(name: "category_icon") this.icon = ""});

  factory _$CatTabsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatTabsModelImplFromJson(json);

  @override
  @JsonKey(name: "category_code")
  final String code;
  @override
  @JsonKey(name: "category_name")
  final String name;
  @override
  @JsonKey(name: "category_icon")
  final String icon;

  @override
  String toString() {
    return 'CatTabsModel(code: $code, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatTabsModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatTabsModelImplCopyWith<_$CatTabsModelImpl> get copyWith =>
      __$$CatTabsModelImplCopyWithImpl<_$CatTabsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatTabsModelImplToJson(
      this,
    );
  }
}

abstract class _CatTabsModel implements CatTabsModel {
  const factory _CatTabsModel(
      {@JsonKey(name: "category_code") final String code,
      @JsonKey(name: "category_name") final String name,
      @JsonKey(name: "category_icon") final String icon}) = _$CatTabsModelImpl;

  factory _CatTabsModel.fromJson(Map<String, dynamic> json) =
      _$CatTabsModelImpl.fromJson;

  @override
  @JsonKey(name: "category_code")
  String get code;
  @override
  @JsonKey(name: "category_name")
  String get name;
  @override
  @JsonKey(name: "category_icon")
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$CatTabsModelImplCopyWith<_$CatTabsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
