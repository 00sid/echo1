// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MomentModelImpl _$$MomentModelImplFromJson(Map<String, dynamic> json) =>
    _$MomentModelImpl(
      momentId: json['momentId'] as String,
      userId: json['userId'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      seenBy:
          (json['seenBy'] as List<dynamic>).map((e) => e as String).toList(),
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MomentModelImplToJson(_$MomentModelImpl instance) =>
    <String, dynamic>{
      'momentId': instance.momentId,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'seenBy': instance.seenBy,
      'likes': instance.likes,
    };
