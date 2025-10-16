// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_tabs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CatTabsState {
  List<CatTabsModel> get catTabsModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CatTabsModel> catTabsModel) loading,
    required TResult Function(List<CatTabsModel> catTabsModel) content,
    required TResult Function(List<CatTabsModel> catTabsModel) success,
    required TResult Function(List<CatTabsModel> catTabsModel, dynamic message)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CatTabsModel> catTabsModel)? loading,
    TResult? Function(List<CatTabsModel> catTabsModel)? content,
    TResult? Function(List<CatTabsModel> catTabsModel)? success,
    TResult? Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CatTabsModel> catTabsModel)? loading,
    TResult Function(List<CatTabsModel> catTabsModel)? content,
    TResult Function(List<CatTabsModel> catTabsModel)? success,
    TResult Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatTabsStateCopyWith<CatTabsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatTabsStateCopyWith<$Res> {
  factory $CatTabsStateCopyWith(
          CatTabsState value, $Res Function(CatTabsState) then) =
      _$CatTabsStateCopyWithImpl<$Res, CatTabsState>;
  @useResult
  $Res call({List<CatTabsModel> catTabsModel});
}

/// @nodoc
class _$CatTabsStateCopyWithImpl<$Res, $Val extends CatTabsState>
    implements $CatTabsStateCopyWith<$Res> {
  _$CatTabsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catTabsModel = null,
  }) {
    return _then(_value.copyWith(
      catTabsModel: null == catTabsModel
          ? _value.catTabsModel
          : catTabsModel // ignore: cast_nullable_to_non_nullable
              as List<CatTabsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $CatTabsStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatTabsModel> catTabsModel});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CatTabsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catTabsModel = null,
  }) {
    return _then(_$LoadingImpl(
      null == catTabsModel
          ? _value._catTabsModel
          : catTabsModel // ignore: cast_nullable_to_non_nullable
              as List<CatTabsModel>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(final List<CatTabsModel> catTabsModel)
      : _catTabsModel = catTabsModel;

  final List<CatTabsModel> _catTabsModel;
  @override
  List<CatTabsModel> get catTabsModel {
    if (_catTabsModel is EqualUnmodifiableListView) return _catTabsModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_catTabsModel);
  }

  @override
  String toString() {
    return 'CatTabsState.loading(catTabsModel: $catTabsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._catTabsModel, _catTabsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_catTabsModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CatTabsModel> catTabsModel) loading,
    required TResult Function(List<CatTabsModel> catTabsModel) content,
    required TResult Function(List<CatTabsModel> catTabsModel) success,
    required TResult Function(List<CatTabsModel> catTabsModel, dynamic message)
        failed,
  }) {
    return loading(catTabsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CatTabsModel> catTabsModel)? loading,
    TResult? Function(List<CatTabsModel> catTabsModel)? content,
    TResult? Function(List<CatTabsModel> catTabsModel)? success,
    TResult? Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
  }) {
    return loading?.call(catTabsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CatTabsModel> catTabsModel)? loading,
    TResult Function(List<CatTabsModel> catTabsModel)? content,
    TResult Function(List<CatTabsModel> catTabsModel)? success,
    TResult Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(catTabsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CatTabsState {
  const factory _Loading(final List<CatTabsModel> catTabsModel) = _$LoadingImpl;

  @override
  List<CatTabsModel> get catTabsModel;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res>
    implements $CatTabsStateCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatTabsModel> catTabsModel});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$CatTabsStateCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catTabsModel = null,
  }) {
    return _then(_$ContentImpl(
      null == catTabsModel
          ? _value._catTabsModel
          : catTabsModel // ignore: cast_nullable_to_non_nullable
              as List<CatTabsModel>,
    ));
  }
}

/// @nodoc

class _$ContentImpl implements _Content {
  const _$ContentImpl(final List<CatTabsModel> catTabsModel)
      : _catTabsModel = catTabsModel;

  final List<CatTabsModel> _catTabsModel;
  @override
  List<CatTabsModel> get catTabsModel {
    if (_catTabsModel is EqualUnmodifiableListView) return _catTabsModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_catTabsModel);
  }

  @override
  String toString() {
    return 'CatTabsState.content(catTabsModel: $catTabsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            const DeepCollectionEquality()
                .equals(other._catTabsModel, _catTabsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_catTabsModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CatTabsModel> catTabsModel) loading,
    required TResult Function(List<CatTabsModel> catTabsModel) content,
    required TResult Function(List<CatTabsModel> catTabsModel) success,
    required TResult Function(List<CatTabsModel> catTabsModel, dynamic message)
        failed,
  }) {
    return content(catTabsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CatTabsModel> catTabsModel)? loading,
    TResult? Function(List<CatTabsModel> catTabsModel)? content,
    TResult? Function(List<CatTabsModel> catTabsModel)? success,
    TResult? Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
  }) {
    return content?.call(catTabsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CatTabsModel> catTabsModel)? loading,
    TResult Function(List<CatTabsModel> catTabsModel)? content,
    TResult Function(List<CatTabsModel> catTabsModel)? success,
    TResult Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(catTabsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements CatTabsState {
  const factory _Content(final List<CatTabsModel> catTabsModel) = _$ContentImpl;

  @override
  List<CatTabsModel> get catTabsModel;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $CatTabsStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatTabsModel> catTabsModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CatTabsStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catTabsModel = null,
  }) {
    return _then(_$SuccessImpl(
      null == catTabsModel
          ? _value._catTabsModel
          : catTabsModel // ignore: cast_nullable_to_non_nullable
              as List<CatTabsModel>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<CatTabsModel> catTabsModel)
      : _catTabsModel = catTabsModel;

  final List<CatTabsModel> _catTabsModel;
  @override
  List<CatTabsModel> get catTabsModel {
    if (_catTabsModel is EqualUnmodifiableListView) return _catTabsModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_catTabsModel);
  }

  @override
  String toString() {
    return 'CatTabsState.success(catTabsModel: $catTabsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._catTabsModel, _catTabsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_catTabsModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CatTabsModel> catTabsModel) loading,
    required TResult Function(List<CatTabsModel> catTabsModel) content,
    required TResult Function(List<CatTabsModel> catTabsModel) success,
    required TResult Function(List<CatTabsModel> catTabsModel, dynamic message)
        failed,
  }) {
    return success(catTabsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CatTabsModel> catTabsModel)? loading,
    TResult? Function(List<CatTabsModel> catTabsModel)? content,
    TResult? Function(List<CatTabsModel> catTabsModel)? success,
    TResult? Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
  }) {
    return success?.call(catTabsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CatTabsModel> catTabsModel)? loading,
    TResult Function(List<CatTabsModel> catTabsModel)? content,
    TResult Function(List<CatTabsModel> catTabsModel)? success,
    TResult Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(catTabsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CatTabsState {
  const factory _Success(final List<CatTabsModel> catTabsModel) = _$SuccessImpl;

  @override
  List<CatTabsModel> get catTabsModel;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res>
    implements $CatTabsStateCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatTabsModel> catTabsModel, dynamic message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$CatTabsStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catTabsModel = null,
    Object? message = freezed,
  }) {
    return _then(_$FailedImpl(
      null == catTabsModel
          ? _value._catTabsModel
          : catTabsModel // ignore: cast_nullable_to_non_nullable
              as List<CatTabsModel>,
      freezed == message ? _value.message! : message,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl(final List<CatTabsModel> catTabsModel, this.message)
      : _catTabsModel = catTabsModel;

  final List<CatTabsModel> _catTabsModel;
  @override
  List<CatTabsModel> get catTabsModel {
    if (_catTabsModel is EqualUnmodifiableListView) return _catTabsModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_catTabsModel);
  }

  @override
  final dynamic message;

  @override
  String toString() {
    return 'CatTabsState.failed(catTabsModel: $catTabsModel, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            const DeepCollectionEquality()
                .equals(other._catTabsModel, _catTabsModel) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_catTabsModel),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CatTabsModel> catTabsModel) loading,
    required TResult Function(List<CatTabsModel> catTabsModel) content,
    required TResult Function(List<CatTabsModel> catTabsModel) success,
    required TResult Function(List<CatTabsModel> catTabsModel, dynamic message)
        failed,
  }) {
    return failed(catTabsModel, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CatTabsModel> catTabsModel)? loading,
    TResult? Function(List<CatTabsModel> catTabsModel)? content,
    TResult? Function(List<CatTabsModel> catTabsModel)? success,
    TResult? Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
  }) {
    return failed?.call(catTabsModel, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CatTabsModel> catTabsModel)? loading,
    TResult Function(List<CatTabsModel> catTabsModel)? content,
    TResult Function(List<CatTabsModel> catTabsModel)? success,
    TResult Function(List<CatTabsModel> catTabsModel, dynamic message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(catTabsModel, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Content value)? content,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements CatTabsState {
  const factory _Failed(
          final List<CatTabsModel> catTabsModel, final dynamic message) =
      _$FailedImpl;

  @override
  List<CatTabsModel> get catTabsModel;
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
