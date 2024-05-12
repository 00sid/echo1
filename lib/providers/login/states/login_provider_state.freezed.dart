// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginProviderState {
  LoginUserState get loginUserState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginProviderStateCopyWith<LoginProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginProviderStateCopyWith<$Res> {
  factory $LoginProviderStateCopyWith(
          LoginProviderState value, $Res Function(LoginProviderState) then) =
      _$LoginProviderStateCopyWithImpl<$Res, LoginProviderState>;
  @useResult
  $Res call({LoginUserState loginUserState});

  $LoginUserStateCopyWith<$Res> get loginUserState;
}

/// @nodoc
class _$LoginProviderStateCopyWithImpl<$Res, $Val extends LoginProviderState>
    implements $LoginProviderStateCopyWith<$Res> {
  _$LoginProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginUserState = null,
  }) {
    return _then(_value.copyWith(
      loginUserState: null == loginUserState
          ? _value.loginUserState
          : loginUserState // ignore: cast_nullable_to_non_nullable
              as LoginUserState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginUserStateCopyWith<$Res> get loginUserState {
    return $LoginUserStateCopyWith<$Res>(_value.loginUserState, (value) {
      return _then(_value.copyWith(loginUserState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginProviderStateImplCopyWith<$Res>
    implements $LoginProviderStateCopyWith<$Res> {
  factory _$$LoginProviderStateImplCopyWith(_$LoginProviderStateImpl value,
          $Res Function(_$LoginProviderStateImpl) then) =
      __$$LoginProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginUserState loginUserState});

  @override
  $LoginUserStateCopyWith<$Res> get loginUserState;
}

/// @nodoc
class __$$LoginProviderStateImplCopyWithImpl<$Res>
    extends _$LoginProviderStateCopyWithImpl<$Res, _$LoginProviderStateImpl>
    implements _$$LoginProviderStateImplCopyWith<$Res> {
  __$$LoginProviderStateImplCopyWithImpl(_$LoginProviderStateImpl _value,
      $Res Function(_$LoginProviderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginUserState = null,
  }) {
    return _then(_$LoginProviderStateImpl(
      loginUserState: null == loginUserState
          ? _value.loginUserState
          : loginUserState // ignore: cast_nullable_to_non_nullable
              as LoginUserState,
    ));
  }
}

/// @nodoc

class _$LoginProviderStateImpl implements _LoginProviderState {
  const _$LoginProviderStateImpl(
      {this.loginUserState = const LoginUserState.initial()});

  @override
  @JsonKey()
  final LoginUserState loginUserState;

  @override
  String toString() {
    return 'LoginProviderState(loginUserState: $loginUserState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginProviderStateImpl &&
            (identical(other.loginUserState, loginUserState) ||
                other.loginUserState == loginUserState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginUserState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginProviderStateImplCopyWith<_$LoginProviderStateImpl> get copyWith =>
      __$$LoginProviderStateImplCopyWithImpl<_$LoginProviderStateImpl>(
          this, _$identity);
}

abstract class _LoginProviderState implements LoginProviderState {
  const factory _LoginProviderState({final LoginUserState loginUserState}) =
      _$LoginProviderStateImpl;

  @override
  LoginUserState get loginUserState;
  @override
  @JsonKey(ignore: true)
  _$$LoginProviderStateImplCopyWith<_$LoginProviderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser user) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser user)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser user)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginUserStateInitial value) initial,
    required TResult Function(_LoginUserStateLoading value) loading,
    required TResult Function(_LoginUserStateSuccess value) success,
    required TResult Function(_LoginUserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginUserStateInitial value)? initial,
    TResult? Function(_LoginUserStateLoading value)? loading,
    TResult? Function(_LoginUserStateSuccess value)? success,
    TResult? Function(_LoginUserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginUserStateInitial value)? initial,
    TResult Function(_LoginUserStateLoading value)? loading,
    TResult Function(_LoginUserStateSuccess value)? success,
    TResult Function(_LoginUserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserStateCopyWith<$Res> {
  factory $LoginUserStateCopyWith(
          LoginUserState value, $Res Function(LoginUserState) then) =
      _$LoginUserStateCopyWithImpl<$Res, LoginUserState>;
}

/// @nodoc
class _$LoginUserStateCopyWithImpl<$Res, $Val extends LoginUserState>
    implements $LoginUserStateCopyWith<$Res> {
  _$LoginUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginUserStateInitialImplCopyWith<$Res> {
  factory _$$LoginUserStateInitialImplCopyWith(
          _$LoginUserStateInitialImpl value,
          $Res Function(_$LoginUserStateInitialImpl) then) =
      __$$LoginUserStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginUserStateInitialImplCopyWithImpl<$Res>
    extends _$LoginUserStateCopyWithImpl<$Res, _$LoginUserStateInitialImpl>
    implements _$$LoginUserStateInitialImplCopyWith<$Res> {
  __$$LoginUserStateInitialImplCopyWithImpl(_$LoginUserStateInitialImpl _value,
      $Res Function(_$LoginUserStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginUserStateInitialImpl implements _LoginUserStateInitial {
  const _$LoginUserStateInitialImpl();

  @override
  String toString() {
    return 'LoginUserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser user) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser user)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser user)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginUserStateInitial value) initial,
    required TResult Function(_LoginUserStateLoading value) loading,
    required TResult Function(_LoginUserStateSuccess value) success,
    required TResult Function(_LoginUserStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginUserStateInitial value)? initial,
    TResult? Function(_LoginUserStateLoading value)? loading,
    TResult? Function(_LoginUserStateSuccess value)? success,
    TResult? Function(_LoginUserStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginUserStateInitial value)? initial,
    TResult Function(_LoginUserStateLoading value)? loading,
    TResult Function(_LoginUserStateSuccess value)? success,
    TResult Function(_LoginUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LoginUserStateInitial implements LoginUserState {
  const factory _LoginUserStateInitial() = _$LoginUserStateInitialImpl;
}

/// @nodoc
abstract class _$$LoginUserStateLoadingImplCopyWith<$Res> {
  factory _$$LoginUserStateLoadingImplCopyWith(
          _$LoginUserStateLoadingImpl value,
          $Res Function(_$LoginUserStateLoadingImpl) then) =
      __$$LoginUserStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginUserStateLoadingImplCopyWithImpl<$Res>
    extends _$LoginUserStateCopyWithImpl<$Res, _$LoginUserStateLoadingImpl>
    implements _$$LoginUserStateLoadingImplCopyWith<$Res> {
  __$$LoginUserStateLoadingImplCopyWithImpl(_$LoginUserStateLoadingImpl _value,
      $Res Function(_$LoginUserStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginUserStateLoadingImpl implements _LoginUserStateLoading {
  const _$LoginUserStateLoadingImpl();

  @override
  String toString() {
    return 'LoginUserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser user) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser user)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser user)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginUserStateInitial value) initial,
    required TResult Function(_LoginUserStateLoading value) loading,
    required TResult Function(_LoginUserStateSuccess value) success,
    required TResult Function(_LoginUserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginUserStateInitial value)? initial,
    TResult? Function(_LoginUserStateLoading value)? loading,
    TResult? Function(_LoginUserStateSuccess value)? success,
    TResult? Function(_LoginUserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginUserStateInitial value)? initial,
    TResult Function(_LoginUserStateLoading value)? loading,
    TResult Function(_LoginUserStateSuccess value)? success,
    TResult Function(_LoginUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoginUserStateLoading implements LoginUserState {
  const factory _LoginUserStateLoading() = _$LoginUserStateLoadingImpl;
}

/// @nodoc
abstract class _$$LoginUserStateSuccessImplCopyWith<$Res> {
  factory _$$LoginUserStateSuccessImplCopyWith(
          _$LoginUserStateSuccessImpl value,
          $Res Function(_$LoginUserStateSuccessImpl) then) =
      __$$LoginUserStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanUser user});

  $PeamanUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginUserStateSuccessImplCopyWithImpl<$Res>
    extends _$LoginUserStateCopyWithImpl<$Res, _$LoginUserStateSuccessImpl>
    implements _$$LoginUserStateSuccessImplCopyWith<$Res> {
  __$$LoginUserStateSuccessImplCopyWithImpl(_$LoginUserStateSuccessImpl _value,
      $Res Function(_$LoginUserStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoginUserStateSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PeamanUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanUserCopyWith<$Res> get user {
    return $PeamanUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoginUserStateSuccessImpl implements _LoginUserStateSuccess {
  const _$LoginUserStateSuccessImpl(this.user);

  @override
  final PeamanUser user;

  @override
  String toString() {
    return 'LoginUserState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserStateSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserStateSuccessImplCopyWith<_$LoginUserStateSuccessImpl>
      get copyWith => __$$LoginUserStateSuccessImplCopyWithImpl<
          _$LoginUserStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser user) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser user)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser user)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginUserStateInitial value) initial,
    required TResult Function(_LoginUserStateLoading value) loading,
    required TResult Function(_LoginUserStateSuccess value) success,
    required TResult Function(_LoginUserStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginUserStateInitial value)? initial,
    TResult? Function(_LoginUserStateLoading value)? loading,
    TResult? Function(_LoginUserStateSuccess value)? success,
    TResult? Function(_LoginUserStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginUserStateInitial value)? initial,
    TResult Function(_LoginUserStateLoading value)? loading,
    TResult Function(_LoginUserStateSuccess value)? success,
    TResult Function(_LoginUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LoginUserStateSuccess implements LoginUserState {
  const factory _LoginUserStateSuccess(final PeamanUser user) =
      _$LoginUserStateSuccessImpl;

  PeamanUser get user;
  @JsonKey(ignore: true)
  _$$LoginUserStateSuccessImplCopyWith<_$LoginUserStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginUserStateErrorImplCopyWith<$Res> {
  factory _$$LoginUserStateErrorImplCopyWith(_$LoginUserStateErrorImpl value,
          $Res Function(_$LoginUserStateErrorImpl) then) =
      __$$LoginUserStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$LoginUserStateErrorImplCopyWithImpl<$Res>
    extends _$LoginUserStateCopyWithImpl<$Res, _$LoginUserStateErrorImpl>
    implements _$$LoginUserStateErrorImplCopyWith<$Res> {
  __$$LoginUserStateErrorImplCopyWithImpl(_$LoginUserStateErrorImpl _value,
      $Res Function(_$LoginUserStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LoginUserStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanErrorCopyWith<$Res> get error {
    return $PeamanErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$LoginUserStateErrorImpl implements _LoginUserStateError {
  const _$LoginUserStateErrorImpl(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'LoginUserState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserStateErrorImplCopyWith<_$LoginUserStateErrorImpl> get copyWith =>
      __$$LoginUserStateErrorImplCopyWithImpl<_$LoginUserStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser user) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser user)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser user)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginUserStateInitial value) initial,
    required TResult Function(_LoginUserStateLoading value) loading,
    required TResult Function(_LoginUserStateSuccess value) success,
    required TResult Function(_LoginUserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginUserStateInitial value)? initial,
    TResult? Function(_LoginUserStateLoading value)? loading,
    TResult? Function(_LoginUserStateSuccess value)? success,
    TResult? Function(_LoginUserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginUserStateInitial value)? initial,
    TResult Function(_LoginUserStateLoading value)? loading,
    TResult Function(_LoginUserStateSuccess value)? success,
    TResult Function(_LoginUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _LoginUserStateError implements LoginUserState {
  const factory _LoginUserStateError(final PeamanError error) =
      _$LoginUserStateErrorImpl;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$LoginUserStateErrorImplCopyWith<_$LoginUserStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
