import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'echo_view_comments_provider_state.freezed.dart';

@freezed
class EchoViewCommentsProviderState with _$EchoViewCommentsProviderState {
  const factory EchoViewCommentsProviderState({
    /// The state of fetching the comments for the feed.
    @Default(FetchEchoFeedCommentsState.initial())
    final FetchEchoFeedCommentsState fetchEchoFeedCommentsState,

    /// The state of commenting on the feed.
    @Default(PostEchoFeedCommentState.initial())
    final PostEchoFeedCommentState postFeedCommentState,

    /// The state of reply to a comment.
    @Default(PostEchoCommentReplyState.initial())
    final PostEchoCommentReplyState postEchoCommentReplyState,
  }) = _EchoViewCommentsProviderState;
}

@freezed
class FetchEchoFeedCommentsState with _$FetchEchoFeedCommentsState {
  const factory FetchEchoFeedCommentsState.initial() =
      _FetchEchoFeedCommentsStateInitial;
  const factory FetchEchoFeedCommentsState.loading() =
      _FetchEchoFeedCommentsStateLoading;
  const factory FetchEchoFeedCommentsState.success(
    final List<PeamanComment> result,
  ) = _FetchEchoFeedCommentsStateSuccess;
  const factory FetchEchoFeedCommentsState.error(
    final PeamanError error,
  ) = _FetchEchoFeedCommentsStateError;
}

@freezed
class PostEchoFeedCommentState with _$PostEchoFeedCommentState {
  const factory PostEchoFeedCommentState.initial() =
      _PostEchoFeedCommentStateInitial;
  const factory PostEchoFeedCommentState.loading() =
      _PostEchoFeedCommentStateLoading;
  const factory PostEchoFeedCommentState.success(
    final PeamanComment result,
  ) = _PostEchoFeedCommentStateSuccess;
  const factory PostEchoFeedCommentState.error(
    final PeamanError error,
  ) = _PostEchoFeedCommentStateError;
}

@freezed
class PostEchoCommentReplyState with _$PostEchoCommentReplyState {
  const factory PostEchoCommentReplyState.initial() =
      _PostEchoCommentReplyStateInitial;
  const factory PostEchoCommentReplyState.loading() =
      _PostEchoCommentReplyStateLoading;
  const factory PostEchoCommentReplyState.success(
    final PeamanComment result,
  ) = _PostEchoCommentReplyStateSuccess;
  const factory PostEchoCommentReplyState.error(
    final PeamanError error,
  ) = _PostEchoCommentReplyStateError;
}
