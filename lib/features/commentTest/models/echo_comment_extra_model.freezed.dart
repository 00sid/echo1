// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'echo_comment_extra_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EchoCommentExtraModel _$EchoCommentExtraModelFromJson(
    Map<String, dynamic> json) {
  return _EchoCommentExtraModel.fromJson(json);
}

/// @nodoc
mixin _$EchoCommentExtraModel {
  /// Whether the comment is local or not.
  ///
  /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
  bool get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EchoCommentExtraModelCopyWith<EchoCommentExtraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EchoCommentExtraModelCopyWith<$Res> {
  factory $EchoCommentExtraModelCopyWith(EchoCommentExtraModel value,
          $Res Function(EchoCommentExtraModel) then) =
      _$EchoCommentExtraModelCopyWithImpl<$Res, EchoCommentExtraModel>;
  @useResult
  $Res call({bool isLocal});
}

/// @nodoc
class _$EchoCommentExtraModelCopyWithImpl<$Res,
        $Val extends EchoCommentExtraModel>
    implements $EchoCommentExtraModelCopyWith<$Res> {
  _$EchoCommentExtraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocal = null,
  }) {
    return _then(_value.copyWith(
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EchoCommentExtraModelImplCopyWith<$Res>
    implements $EchoCommentExtraModelCopyWith<$Res> {
  factory _$$EchoCommentExtraModelImplCopyWith(
          _$EchoCommentExtraModelImpl value,
          $Res Function(_$EchoCommentExtraModelImpl) then) =
      __$$EchoCommentExtraModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLocal});
}

/// @nodoc
class __$$EchoCommentExtraModelImplCopyWithImpl<$Res>
    extends _$EchoCommentExtraModelCopyWithImpl<$Res,
        _$EchoCommentExtraModelImpl>
    implements _$$EchoCommentExtraModelImplCopyWith<$Res> {
  __$$EchoCommentExtraModelImplCopyWithImpl(_$EchoCommentExtraModelImpl _value,
      $Res Function(_$EchoCommentExtraModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocal = null,
  }) {
    return _then(_$EchoCommentExtraModelImpl(
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EchoCommentExtraModelImpl implements _EchoCommentExtraModel {
  const _$EchoCommentExtraModelImpl({this.isLocal = false});

  factory _$EchoCommentExtraModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EchoCommentExtraModelImplFromJson(json);

  /// Whether the comment is local or not.
  ///
  /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
  @override
  @JsonKey()
  final bool isLocal;

  @override
  String toString() {
    return 'EchoCommentExtraModel(isLocal: $isLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EchoCommentExtraModelImpl &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EchoCommentExtraModelImplCopyWith<_$EchoCommentExtraModelImpl>
      get copyWith => __$$EchoCommentExtraModelImplCopyWithImpl<
          _$EchoCommentExtraModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EchoCommentExtraModelImplToJson(
      this,
    );
  }
}

abstract class _EchoCommentExtraModel implements EchoCommentExtraModel {
  const factory _EchoCommentExtraModel({final bool isLocal}) =
      _$EchoCommentExtraModelImpl;

  factory _EchoCommentExtraModel.fromJson(Map<String, dynamic> json) =
      _$EchoCommentExtraModelImpl.fromJson;

  @override

  /// Whether the comment is local or not.
  ///
  /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
  bool get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$EchoCommentExtraModelImplCopyWith<_$EchoCommentExtraModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
