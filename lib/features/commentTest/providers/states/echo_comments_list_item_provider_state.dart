import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'echo_comments_list_item_provider_state.freezed.dart';

@freezed
class EchoCommentsListItemProviderState
    with _$EchoCommentsListItemProviderState {
  const factory EchoCommentsListItemProviderState({
    /// Whether the replies of this comment are visible or not.
    @Default(false) final bool isRepliesVisible,

    /// The state of fetching the comments for the feed.
    @Default(FetchEchoCommentsReplyState.initial())
    final FetchEchoCommentsReplyState fetchCommentsReplyState,

    /// The state of creating a comment.
    @Default(CreateEchoCommentState.initial())
    final CreateEchoCommentState createEchoCommentState,

    /// The state of reacting to the comment.
    @Default(ReactToEchoCommentState.initial())
    final ReactToEchoCommentState reactToEchoCommentState,
  }) = _EchoCommentsListItemProviderState;
}

@freezed
class FetchEchoCommentsReplyState with _$FetchEchoCommentsReplyState {
  const factory FetchEchoCommentsReplyState.initial() =
      _FetchEchoCommentsReplyStateInitial;
  const factory FetchEchoCommentsReplyState.loading() =
      _FetchEchoCommentsReplyStateLoading;
  const factory FetchEchoCommentsReplyState.success(
    final List<PeamanComment> result,
  ) = _FetchEchoCommentsReplyStateSuccess;
  const factory FetchEchoCommentsReplyState.error(
    final PeamanError error,
  ) = _FetchEchoCommentsReplyStateError;
}

@freezed
class CreateEchoCommentState with _$CreateEchoCommentState {
  const factory CreateEchoCommentState.initial() =
      _CreateEchoCommentStateInitial;
  const factory CreateEchoCommentState.loading() =
      _CreateEchoCommentStateLoading;
  const factory CreateEchoCommentState.success(
    final PeamanComment result,
  ) = _CreateEchoCommentStateSuccess;
  const factory CreateEchoCommentState.error(
    final PeamanError error,
  ) = _CreateEchoCommentStateError;
}

@freezed
class ReactToEchoCommentState with _$ReactToEchoCommentState {
  const factory ReactToEchoCommentState.initial() =
      _ReactToEchoCommentStateInitial;
  const factory ReactToEchoCommentState.loading() =
      _ReactToEchoCommentStateLoading;
  const factory ReactToEchoCommentState.success(
    final PeamanReaction result,
  ) = _ReactToEchoCommentStateSuccess;
  const factory ReactToEchoCommentState.error(
    final PeamanError error,
  ) = _ReactToEchoCommentStateError;
}
