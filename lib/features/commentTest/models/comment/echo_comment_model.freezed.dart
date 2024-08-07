// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'echo_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EchoComment _$EchoCommentFromJson(Map<String, dynamic> json) {
  return _EchoComment.fromJson(json);
}

/// @nodoc
mixin _$EchoComment {
  String? get id => throw _privateConstructorUsedError;
  String? get feedId => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String? get secondUserId => throw _privateConstructorUsedError;
  String? get secondUserName => throw _privateConstructorUsedError;
  PeamanCommentParent get parent => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get parentOwnerId => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int get reactionsCount => throw _privateConstructorUsedError;
  int get repliesCount => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  String? get audioUrl => throw _privateConstructorUsedError;
  bool get isAudio => throw _privateConstructorUsedError;
  Map<String, dynamic> get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EchoCommentCopyWith<EchoComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EchoCommentCopyWith<$Res> {
  factory $EchoCommentCopyWith(
          EchoComment value, $Res Function(EchoComment) then) =
      _$EchoCommentCopyWithImpl<$Res, EchoComment>;
  @useResult
  $Res call(
      {String? id,
      String? feedId,
      String? ownerId,
      String? secondUserId,
      String? secondUserName,
      PeamanCommentParent parent,
      String? parentId,
      String? parentOwnerId,
      String? comment,
      int reactionsCount,
      int repliesCount,
      int? createdAt,
      int? updatedAt,
      bool visibility,
      String? audioUrl,
      bool isAudio,
      Map<String, dynamic> extraData});
}

/// @nodoc
class _$EchoCommentCopyWithImpl<$Res, $Val extends EchoComment>
    implements $EchoCommentCopyWith<$Res> {
  _$EchoCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? feedId = freezed,
    Object? ownerId = freezed,
    Object? secondUserId = freezed,
    Object? secondUserName = freezed,
    Object? parent = null,
    Object? parentId = freezed,
    Object? parentOwnerId = freezed,
    Object? comment = freezed,
    Object? reactionsCount = null,
    Object? repliesCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? visibility = null,
    Object? audioUrl = freezed,
    Object? isAudio = null,
    Object? extraData = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondUserId: freezed == secondUserId
          ? _value.secondUserId
          : secondUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondUserName: freezed == secondUserName
          ? _value.secondUserName
          : secondUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as PeamanCommentParent,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentOwnerId: freezed == parentOwnerId
          ? _value.parentOwnerId
          : parentOwnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionsCount: null == reactionsCount
          ? _value.reactionsCount
          : reactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAudio: null == isAudio
          ? _value.isAudio
          : isAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: null == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EchoCommentImplCopyWith<$Res>
    implements $EchoCommentCopyWith<$Res> {
  factory _$$EchoCommentImplCopyWith(
          _$EchoCommentImpl value, $Res Function(_$EchoCommentImpl) then) =
      __$$EchoCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? feedId,
      String? ownerId,
      String? secondUserId,
      String? secondUserName,
      PeamanCommentParent parent,
      String? parentId,
      String? parentOwnerId,
      String? comment,
      int reactionsCount,
      int repliesCount,
      int? createdAt,
      int? updatedAt,
      bool visibility,
      String? audioUrl,
      bool isAudio,
      Map<String, dynamic> extraData});
}

/// @nodoc
class __$$EchoCommentImplCopyWithImpl<$Res>
    extends _$EchoCommentCopyWithImpl<$Res, _$EchoCommentImpl>
    implements _$$EchoCommentImplCopyWith<$Res> {
  __$$EchoCommentImplCopyWithImpl(
      _$EchoCommentImpl _value, $Res Function(_$EchoCommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? feedId = freezed,
    Object? ownerId = freezed,
    Object? secondUserId = freezed,
    Object? secondUserName = freezed,
    Object? parent = null,
    Object? parentId = freezed,
    Object? parentOwnerId = freezed,
    Object? comment = freezed,
    Object? reactionsCount = null,
    Object? repliesCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? visibility = null,
    Object? audioUrl = freezed,
    Object? isAudio = null,
    Object? extraData = null,
  }) {
    return _then(_$EchoCommentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondUserId: freezed == secondUserId
          ? _value.secondUserId
          : secondUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      secondUserName: freezed == secondUserName
          ? _value.secondUserName
          : secondUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as PeamanCommentParent,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentOwnerId: freezed == parentOwnerId
          ? _value.parentOwnerId
          : parentOwnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionsCount: null == reactionsCount
          ? _value.reactionsCount
          : reactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAudio: null == isAudio
          ? _value.isAudio
          : isAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      extraData: null == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EchoCommentImpl implements _EchoComment {
  const _$EchoCommentImpl(
      {this.id,
      this.feedId,
      this.ownerId,
      this.secondUserId,
      this.secondUserName,
      this.parent = PeamanCommentParent.feed,
      this.parentId,
      this.parentOwnerId,
      this.comment,
      this.reactionsCount = 0,
      this.repliesCount = 0,
      this.createdAt,
      this.updatedAt,
      this.visibility = true,
      this.audioUrl,
      this.isAudio = false,
      final Map<String, dynamic> extraData = const <String, dynamic>{}})
      : _extraData = extraData;

  factory _$EchoCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EchoCommentImplFromJson(json);

  @override
  final String? id;
  @override
  final String? feedId;
  @override
  final String? ownerId;
  @override
  final String? secondUserId;
  @override
  final String? secondUserName;
  @override
  @JsonKey()
  final PeamanCommentParent parent;
  @override
  final String? parentId;
  @override
  final String? parentOwnerId;
  @override
  final String? comment;
  @override
  @JsonKey()
  final int reactionsCount;
  @override
  @JsonKey()
  final int repliesCount;
  @override
  final int? createdAt;
  @override
  final int? updatedAt;
  @override
  @JsonKey()
  final bool visibility;
  @override
  final String? audioUrl;
  @override
  @JsonKey()
  final bool isAudio;
  final Map<String, dynamic> _extraData;
  @override
  @JsonKey()
  Map<String, dynamic> get extraData {
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extraData);
  }

  @override
  String toString() {
    return 'EchoComment(id: $id, feedId: $feedId, ownerId: $ownerId, secondUserId: $secondUserId, secondUserName: $secondUserName, parent: $parent, parentId: $parentId, parentOwnerId: $parentOwnerId, comment: $comment, reactionsCount: $reactionsCount, repliesCount: $repliesCount, createdAt: $createdAt, updatedAt: $updatedAt, visibility: $visibility, audioUrl: $audioUrl, isAudio: $isAudio, extraData: $extraData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EchoCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.secondUserId, secondUserId) ||
                other.secondUserId == secondUserId) &&
            (identical(other.secondUserName, secondUserName) ||
                other.secondUserName == secondUserName) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.parentOwnerId, parentOwnerId) ||
                other.parentOwnerId == parentOwnerId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.reactionsCount, reactionsCount) ||
                other.reactionsCount == reactionsCount) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.isAudio, isAudio) || other.isAudio == isAudio) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      feedId,
      ownerId,
      secondUserId,
      secondUserName,
      parent,
      parentId,
      parentOwnerId,
      comment,
      reactionsCount,
      repliesCount,
      createdAt,
      updatedAt,
      visibility,
      audioUrl,
      isAudio,
      const DeepCollectionEquality().hash(_extraData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EchoCommentImplCopyWith<_$EchoCommentImpl> get copyWith =>
      __$$EchoCommentImplCopyWithImpl<_$EchoCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EchoCommentImplToJson(
      this,
    );
  }
}

abstract class _EchoComment implements EchoComment {
  const factory _EchoComment(
      {final String? id,
      final String? feedId,
      final String? ownerId,
      final String? secondUserId,
      final String? secondUserName,
      final PeamanCommentParent parent,
      final String? parentId,
      final String? parentOwnerId,
      final String? comment,
      final int reactionsCount,
      final int repliesCount,
      final int? createdAt,
      final int? updatedAt,
      final bool visibility,
      final String? audioUrl,
      final bool isAudio,
      final Map<String, dynamic> extraData}) = _$EchoCommentImpl;

  factory _EchoComment.fromJson(Map<String, dynamic> json) =
      _$EchoCommentImpl.fromJson;

  @override
  String? get id;
  @override
  String? get feedId;
  @override
  String? get ownerId;
  @override
  String? get secondUserId;
  @override
  String? get secondUserName;
  @override
  PeamanCommentParent get parent;
  @override
  String? get parentId;
  @override
  String? get parentOwnerId;
  @override
  String? get comment;
  @override
  int get reactionsCount;
  @override
  int get repliesCount;
  @override
  int? get createdAt;
  @override
  int? get updatedAt;
  @override
  bool get visibility;
  @override
  String? get audioUrl;
  @override
  bool get isAudio;
  @override
  Map<String, dynamic> get extraData;
  @override
  @JsonKey(ignore: true)
  _$$EchoCommentImplCopyWith<_$EchoCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
