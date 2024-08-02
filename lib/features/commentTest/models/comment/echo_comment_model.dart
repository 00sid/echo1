import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'echo_comment_model.freezed.dart';
part 'echo_comment_model.g.dart';

@freezed
class EchoComment with _$EchoComment {
  const factory EchoComment({
    final String? id,
    final String? feedId,
    final String? ownerId,
    final String? secondUserId,
    final String? secondUserName,
    @Default(PeamanCommentParent.feed) final PeamanCommentParent parent,
    final String? parentId,
    final String? parentOwnerId,
    final String? comment,
    @Default(0) final int reactionsCount,
    @Default(0) final int repliesCount,
    final int? createdAt,
    final int? updatedAt,
    @Default(true) final bool visibility,
    final String? audioUrl,
    @Default(false) final bool isAudio,
    @Default(<String, dynamic>{}) final Map<String, dynamic> extraData,
  }) = _EchoComment;

  factory EchoComment.fromJson(final Map<String, dynamic> data) =>
      _$EchoCommentFromJson(data);
}
