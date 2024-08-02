import 'package:freezed_annotation/freezed_annotation.dart';
part 'echo_comment_extra_model.freezed.dart';
part 'echo_comment_extra_model.g.dart';

@freezed
class EchoCommentExtraModel with _$EchoCommentExtraModel {
  const factory EchoCommentExtraModel({
    /// Whether the comment is local or not.
    ///
    /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
    @Default(false) final bool isLocal,
  }) = _EchoCommentExtraModel;

  factory EchoCommentExtraModel.fromJson(Map<String, dynamic> json) =>
      _$EchoCommentExtraModelFromJson(json);
}
