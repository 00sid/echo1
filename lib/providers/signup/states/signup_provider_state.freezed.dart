// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpProviderState {
  SignUpUserState get signUpUserState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpProviderStateCopyWith<SignUpProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpProviderStateCopyWith<$Res> {
  factory $SignUpProviderStateCopyWith(
          SignUpProviderState value, $Res Function(SignUpProviderState) then) =
      _$SignUpProviderStateCopyWithImpl<$Res, SignUpProviderState>;
  @useResult
  $Res call({SignUpUserState signUpUserState});

  $SignUpUserStateCopyWith<$Res> get signUpUserState;
}

/// @nodoc
class _$SignUpProviderStateCopyWithImpl<$Res, $Val extends SignUpProviderState>
    implements $SignUpProviderStateCopyWith<$Res> {
  _$SignUpProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpUserState = null,
  }) {
    return _then(_value.copyWith(
      signUpUserState: null == signUpUserState
          ? _value.signUpUserState
          : signUpUserState // ignore: cast_nullable_to_non_nullable
              as SignUpUserState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpUserStateCopyWith<$Res> get signUpUserState {
    return $SignUpUserStateCopyWith<$Res>(_value.signUpUserState, (value) {
      return _then(_value.copyWith(signUpUserState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpProviderStateImplCopyWith<$Res>
    implements $SignUpProviderStateCopyWith<$Res> {
  factory _$$SignUpProviderStateImplCopyWith(_$SignUpProviderStateImpl value,
          $Res Function(_$SignUpProviderStateImpl) then) =
      __$$SignUpProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignUpUserState signUpUserState});

  @override
  $SignUpUserStateCopyWith<$Res> get signUpUserState;
}

/// @nodoc
class __$$SignUpProviderStateImplCopyWithImpl<$Res>
    extends _$SignUpProviderStateCopyWithImpl<$Res, _$SignUpProviderStateImpl>
    implements _$$SignUpProviderStateImplCopyWith<$Res> {
  __$$SignUpProviderStateImplCopyWithImpl(_$SignUpProviderStateImpl _value,
      $Res Function(_$SignUpProviderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpUserState = null,
  }) {
    return _then(_$SignUpProviderStateImpl(
      signUpUserState: null == signUpUserState
          ? _value.signUpUserState
          : signUpUserState // ignore: cast_nullable_to_non_nullable
              as SignUpUserState,
    ));
  }
}

/// @nodoc

class _$SignUpProviderStateImpl implements _SignUpProviderState {
  const _$SignUpProviderStateImpl(
      {this.signUpUserState = const SignUpUserState.initial()});

  @override
  @JsonKey()
  final SignUpUserState signUpUserState;

  @override
  String toString() {
    return 'SignUpProviderState(signUpUserState: $signUpUserState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpProviderStateImpl &&
            (identical(other.signUpUserState, signUpUserState) ||
                other.signUpUserState == signUpUserState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpUserState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpProviderStateImplCopyWith<_$SignUpProviderStateImpl> get copyWith =>
      __$$SignUpProviderStateImplCopyWithImpl<_$SignUpProviderStateImpl>(
          this, _$identity);
}

abstract class _SignUpProviderState implements SignUpProviderState {
  const factory _SignUpProviderState({final SignUpUserState signUpUserState}) =
      _$SignUpProviderStateImpl;

  @override
  SignUpUserState get signUpUserState;
  @override
  @JsonKey(ignore: true)
  _$$SignUpProviderStateImplCopyWith<_$SignUpProviderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpUserState {
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
    required TResult Function(_SignUpUserStateInitial value) initial,
    required TResult Function(_SignUpUserStateLoading value) loading,
    required TResult Function(_SignUpUserStateSuccess value) success,
    required TResult Function(_SignUpUserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUserStateInitial value)? initial,
    TResult? Function(_SignUpUserStateLoading value)? loading,
    TResult? Function(_SignUpUserStateSuccess value)? success,
    TResult? Function(_SignUpUserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUserStateInitial value)? initial,
    TResult Function(_SignUpUserStateLoading value)? loading,
    TResult Function(_SignUpUserStateSuccess value)? success,
    TResult Function(_SignUpUserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpUserStateCopyWith<$Res> {
  factory $SignUpUserStateCopyWith(
          SignUpUserState value, $Res Function(SignUpUserState) then) =
      _$SignUpUserStateCopyWithImpl<$Res, SignUpUserState>;
}

/// @nodoc
class _$SignUpUserStateCopyWithImpl<$Res, $Val extends SignUpUserState>
    implements $SignUpUserStateCopyWith<$Res> {
  _$SignUpUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignUpUserStateInitialImplCopyWith<$Res> {
  factory _$$SignUpUserStateInitialImplCopyWith(
          _$SignUpUserStateInitialImpl value,
          $Res Function(_$SignUpUserStateInitialImpl) then) =
      __$$SignUpUserStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpUserStateInitialImplCopyWithImpl<$Res>
    extends _$SignUpUserStateCopyWithImpl<$Res, _$SignUpUserStateInitialImpl>
    implements _$$SignUpUserStateInitialImplCopyWith<$Res> {
  __$$SignUpUserStateInitialImplCopyWithImpl(
      _$SignUpUserStateInitialImpl _value,
      $Res Function(_$SignUpUserStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpUserStateInitialImpl implements _SignUpUserStateInitial {
  const _$SignUpUserStateInitialImpl();

  @override
  String toString() {
    return 'SignUpUserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpUserStateInitialImpl);
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
    required TResult Function(_SignUpUserStateInitial value) initial,
    required TResult Function(_SignUpUserStateLoading value) loading,
    required TResult Function(_SignUpUserStateSuccess value) success,
    required TResult Function(_SignUpUserStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUserStateInitial value)? initial,
    TResult? Function(_SignUpUserStateLoading value)? loading,
    TResult? Function(_SignUpUserStateSuccess value)? success,
    TResult? Function(_SignUpUserStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUserStateInitial value)? initial,
    TResult Function(_SignUpUserStateLoading value)? loading,
    TResult Function(_SignUpUserStateSuccess value)? success,
    TResult Function(_SignUpUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignUpUserStateInitial implements SignUpUserState {
  const factory _SignUpUserStateInitial() = _$SignUpUserStateInitialImpl;
}

/// @nodoc
abstract class _$$SignUpUserStateLoadingImplCopyWith<$Res> {
  factory _$$SignUpUserStateLoadingImplCopyWith(
          _$SignUpUserStateLoadingImpl value,
          $Res Function(_$SignUpUserStateLoadingImpl) then) =
      __$$SignUpUserStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpUserStateLoadingImplCopyWithImpl<$Res>
    extends _$SignUpUserStateCopyWithImpl<$Res, _$SignUpUserStateLoadingImpl>
    implements _$$SignUpUserStateLoadingImplCopyWith<$Res> {
  __$$SignUpUserStateLoadingImplCopyWithImpl(
      _$SignUpUserStateLoadingImpl _value,
      $Res Function(_$SignUpUserStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpUserStateLoadingImpl implements _SignUpUserStateLoading {
  const _$SignUpUserStateLoadingImpl();

  @override
  String toString() {
    return 'SignUpUserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpUserStateLoadingImpl);
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
    required TResult Function(_SignUpUserStateInitial value) initial,
    required TResult Function(_SignUpUserStateLoading value) loading,
    required TResult Function(_SignUpUserStateSuccess value) success,
    required TResult Function(_SignUpUserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUserStateInitial value)? initial,
    TResult? Function(_SignUpUserStateLoading value)? loading,
    TResult? Function(_SignUpUserStateSuccess value)? success,
    TResult? Function(_SignUpUserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUserStateInitial value)? initial,
    TResult Function(_SignUpUserStateLoading value)? loading,
    TResult Function(_SignUpUserStateSuccess value)? success,
    TResult Function(_SignUpUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignUpUserStateLoading implements SignUpUserState {
  const factory _SignUpUserStateLoading() = _$SignUpUserStateLoadingImpl;
}

/// @nodoc
abstract class _$$SignUpUserStateSuccessImplCopyWith<$Res> {
  factory _$$SignUpUserStateSuccessImplCopyWith(
          _$SignUpUserStateSuccessImpl value,
          $Res Function(_$SignUpUserStateSuccessImpl) then) =
      __$$SignUpUserStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanUser user});

  $PeamanUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignUpUserStateSuccessImplCopyWithImpl<$Res>
    extends _$SignUpUserStateCopyWithImpl<$Res, _$SignUpUserStateSuccessImpl>
    implements _$$SignUpUserStateSuccessImplCopyWith<$Res> {
  __$$SignUpUserStateSuccessImplCopyWithImpl(
      _$SignUpUserStateSuccessImpl _value,
      $Res Function(_$SignUpUserStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SignUpUserStateSuccessImpl(
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

class _$SignUpUserStateSuccessImpl implements _SignUpUserStateSuccess {
  const _$SignUpUserStateSuccessImpl(this.user);

  @override
  final PeamanUser user;

  @override
  String toString() {
    return 'SignUpUserState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpUserStateSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpUserStateSuccessImplCopyWith<_$SignUpUserStateSuccessImpl>
      get copyWith => __$$SignUpUserStateSuccessImplCopyWithImpl<
          _$SignUpUserStateSuccessImpl>(this, _$identity);

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
    required TResult Function(_SignUpUserStateInitial value) initial,
    required TResult Function(_SignUpUserStateLoading value) loading,
    required TResult Function(_SignUpUserStateSuccess value) success,
    required TResult Function(_SignUpUserStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUserStateInitial value)? initial,
    TResult? Function(_SignUpUserStateLoading value)? loading,
    TResult? Function(_SignUpUserStateSuccess value)? success,
    TResult? Function(_SignUpUserStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUserStateInitial value)? initial,
    TResult Function(_SignUpUserStateLoading value)? loading,
    TResult Function(_SignUpUserStateSuccess value)? success,
    TResult Function(_SignUpUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignUpUserStateSuccess implements SignUpUserState {
  const factory _SignUpUserStateSuccess(final PeamanUser user) =
      _$SignUpUserStateSuccessImpl;

  PeamanUser get user;
  @JsonKey(ignore: true)
  _$$SignUpUserStateSuccessImplCopyWith<_$SignUpUserStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpUserStateErrorImplCopyWith<$Res> {
  factory _$$SignUpUserStateErrorImplCopyWith(_$SignUpUserStateErrorImpl value,
          $Res Function(_$SignUpUserStateErrorImpl) then) =
      __$$SignUpUserStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$SignUpUserStateErrorImplCopyWithImpl<$Res>
    extends _$SignUpUserStateCopyWithImpl<$Res, _$SignUpUserStateErrorImpl>
    implements _$$SignUpUserStateErrorImplCopyWith<$Res> {
  __$$SignUpUserStateErrorImplCopyWithImpl(_$SignUpUserStateErrorImpl _value,
      $Res Function(_$SignUpUserStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignUpUserStateErrorImpl(
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

class _$SignUpUserStateErrorImpl implements _SignUpUserStateError {
  const _$SignUpUserStateErrorImpl(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SignUpUserState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpUserStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpUserStateErrorImplCopyWith<_$SignUpUserStateErrorImpl>
      get copyWith =>
          __$$SignUpUserStateErrorImplCopyWithImpl<_$SignUpUserStateErrorImpl>(
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
    required TResult Function(_SignUpUserStateInitial value) initial,
    required TResult Function(_SignUpUserStateLoading value) loading,
    required TResult Function(_SignUpUserStateSuccess value) success,
    required TResult Function(_SignUpUserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpUserStateInitial value)? initial,
    TResult? Function(_SignUpUserStateLoading value)? loading,
    TResult? Function(_SignUpUserStateSuccess value)? success,
    TResult? Function(_SignUpUserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpUserStateInitial value)? initial,
    TResult Function(_SignUpUserStateLoading value)? loading,
    TResult Function(_SignUpUserStateSuccess value)? success,
    TResult Function(_SignUpUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignUpUserStateError implements SignUpUserState {
  const factory _SignUpUserStateError(final PeamanError error) =
      _$SignUpUserStateErrorImpl;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$SignUpUserStateErrorImplCopyWith<_$SignUpUserStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
