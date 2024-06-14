// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MomentModel _$MomentModelFromJson(Map<String, dynamic> json) {
  return _MomentModel.fromJson(json);
}

/// @nodoc
mixin _$MomentModel {
  String get momentId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get seenBy => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MomentModelCopyWith<MomentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentModelCopyWith<$Res> {
  factory $MomentModelCopyWith(
          MomentModel value, $Res Function(MomentModel) then) =
      _$MomentModelCopyWithImpl<$Res, MomentModel>;
  @useResult
  $Res call(
      {String momentId,
      String userId,
      String imageUrl,
      DateTime createdAt,
      List<String> seenBy,
      List<String> likes});
}

/// @nodoc
class _$MomentModelCopyWithImpl<$Res, $Val extends MomentModel>
    implements $MomentModelCopyWith<$Res> {
  _$MomentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? momentId = null,
    Object? userId = null,
    Object? imageUrl = null,
    Object? createdAt = null,
    Object? seenBy = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      momentId: null == momentId
          ? _value.momentId
          : momentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seenBy: null == seenBy
          ? _value.seenBy
          : seenBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MomentModelImplCopyWith<$Res>
    implements $MomentModelCopyWith<$Res> {
  factory _$$MomentModelImplCopyWith(
          _$MomentModelImpl value, $Res Function(_$MomentModelImpl) then) =
      __$$MomentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String momentId,
      String userId,
      String imageUrl,
      DateTime createdAt,
      List<String> seenBy,
      List<String> likes});
}

/// @nodoc
class __$$MomentModelImplCopyWithImpl<$Res>
    extends _$MomentModelCopyWithImpl<$Res, _$MomentModelImpl>
    implements _$$MomentModelImplCopyWith<$Res> {
  __$$MomentModelImplCopyWithImpl(
      _$MomentModelImpl _value, $Res Function(_$MomentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? momentId = null,
    Object? userId = null,
    Object? imageUrl = null,
    Object? createdAt = null,
    Object? seenBy = null,
    Object? likes = null,
  }) {
    return _then(_$MomentModelImpl(
      momentId: null == momentId
          ? _value.momentId
          : momentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seenBy: null == seenBy
          ? _value._seenBy
          : seenBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MomentModelImpl implements _MomentModel {
  const _$MomentModelImpl(
      {required this.momentId,
      required this.userId,
      required this.imageUrl,
      required this.createdAt,
      required final List<String> seenBy,
      required final List<String> likes})
      : _seenBy = seenBy,
        _likes = likes;

  factory _$MomentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MomentModelImplFromJson(json);

  @override
  final String momentId;
  @override
  final String userId;
  @override
  final String imageUrl;
  @override
  final DateTime createdAt;
  final List<String> _seenBy;
  @override
  List<String> get seenBy {
    if (_seenBy is EqualUnmodifiableListView) return _seenBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seenBy);
  }

  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString() {
    return 'MomentModel(momentId: $momentId, userId: $userId, imageUrl: $imageUrl, createdAt: $createdAt, seenBy: $seenBy, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MomentModelImpl &&
            (identical(other.momentId, momentId) ||
                other.momentId == momentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._seenBy, _seenBy) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      momentId,
      userId,
      imageUrl,
      createdAt,
      const DeepCollectionEquality().hash(_seenBy),
      const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MomentModelImplCopyWith<_$MomentModelImpl> get copyWith =>
      __$$MomentModelImplCopyWithImpl<_$MomentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MomentModelImplToJson(
      this,
    );
  }
}

abstract class _MomentModel implements MomentModel {
  const factory _MomentModel(
      {required final String momentId,
      required final String userId,
      required final String imageUrl,
      required final DateTime createdAt,
      required final List<String> seenBy,
      required final List<String> likes}) = _$MomentModelImpl;

  factory _MomentModel.fromJson(Map<String, dynamic> json) =
      _$MomentModelImpl.fromJson;

  @override
  String get momentId;
  @override
  String get userId;
  @override
  String get imageUrl;
  @override
  DateTime get createdAt;
  @override
  List<String> get seenBy;
  @override
  List<String> get likes;
  @override
  @JsonKey(ignore: true)
  _$$MomentModelImplCopyWith<_$MomentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
