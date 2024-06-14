import 'package:freezed_annotation/freezed_annotation.dart';

part 'moment_model.freezed.dart';
part 'moment_model.g.dart';

@freezed
class MomentModel with _$MomentModel {
  const factory MomentModel({
    required String momentId,
    required String userId,
    required String imageUrl,
    required DateTime createdAt,
    required List<String> seenBy,
    required List<String> likes,
  }) = _MomentModel;

  factory MomentModel.fromJson(Map<String, dynamic> json) =>
      _$MomentModelFromJson(json);
}
