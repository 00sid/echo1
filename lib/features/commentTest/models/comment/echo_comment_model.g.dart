// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'echo_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EchoCommentImpl _$$EchoCommentImplFromJson(Map<String, dynamic> json) =>
    _$EchoCommentImpl(
      id: json['id'] as String?,
      feedId: json['feedId'] as String?,
      ownerId: json['ownerId'] as String?,
      secondUserId: json['secondUserId'] as String?,
      secondUserName: json['secondUserName'] as String?,
      parent:
          $enumDecodeNullable(_$PeamanCommentParentEnumMap, json['parent']) ??
              PeamanCommentParent.feed,
      parentId: json['parentId'] as String?,
      parentOwnerId: json['parentOwnerId'] as String?,
      comment: json['comment'] as String?,
      reactionsCount: (json['reactionsCount'] as num?)?.toInt() ?? 0,
      repliesCount: (json['repliesCount'] as num?)?.toInt() ?? 0,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      visibility: json['visibility'] as bool? ?? true,
      audioUrl: json['audioUrl'] as String?,
      isAudio: json['isAudio'] as bool? ?? false,
      extraData: json['extraData'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$EchoCommentImplToJson(_$EchoCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'ownerId': instance.ownerId,
      'secondUserId': instance.secondUserId,
      'secondUserName': instance.secondUserName,
      'parent': _$PeamanCommentParentEnumMap[instance.parent]!,
      'parentId': instance.parentId,
      'parentOwnerId': instance.parentOwnerId,
      'comment': instance.comment,
      'reactionsCount': instance.reactionsCount,
      'repliesCount': instance.repliesCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'visibility': instance.visibility,
      'audioUrl': instance.audioUrl,
      'isAudio': instance.isAudio,
      'extraData': instance.extraData,
    };

const _$PeamanCommentParentEnumMap = {
  PeamanCommentParent.feed: 'feed',
  PeamanCommentParent.comment: 'comment',
};
