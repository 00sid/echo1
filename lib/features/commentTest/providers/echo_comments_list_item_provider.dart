import 'package:echo1/features/commentTest/providers/states/echo_comments_list_item_provider_state.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart'
    hide CreateCommentState;

/// Provider of [EchoCommentsListItemProvider].
final providerOfEchoCommentsListItemProvider = StateNotifierProvider.family<
    EchoCommentsListItemProvider, EchoCommentsListItemProviderState, String>(
  (ref, commentId) => EchoCommentsListItemProvider(
    ref: ref,
    state: const EchoCommentsListItemProviderState(),
  ),
);

class EchoCommentsListItemProvider
    extends StateNotifier<EchoCommentsListItemProviderState> {
  /// Handles the state management for the comments list item.
  EchoCommentsListItemProvider({
    required final Ref ref,
    required final EchoCommentsListItemProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  PeamanFeedRepository get _feedRepository =>
      _ref.read(providerOfPeamanFeedRepository);
  PeamanUser get _loggedInUser => _ref.read(providerOfLoggedInUser);

  /// Toggles the visibility of the replies.
  void toggleRepliesVisibility() {
    state = state.copyWith(
      isRepliesVisible: !state.isRepliesVisible,
    );
  }

  /// Fetches the replies for the comment.
  ///
  /// The [feedId] is the id of the feed for which the comments are to be fetched.
  Future<void> fetchCommentReplies({
    required final String feedId,
    required final String commentId,
  }) async {
    state = state.copyWith(
      fetchCommentsReplyState: const FetchEchoCommentsReplyState.loading(),
    );

    final result = await _feedRepository.getCommentsByParentId(
      feedId: feedId,
      parentId: commentId,
      parent: PeamanCommentParent.comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          fetchCommentsReplyState: FetchEchoCommentsReplyState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          fetchCommentsReplyState: FetchEchoCommentsReplyState.error(error),
        );
      },
    );
  }

  /// Creates a comment.
  ///
  /// The [comment] is the comment to be created.
  Future<void> createComment({
    required final PeamanComment comment,
  }) async {
    state = state.copyWith(
      createEchoCommentState: const CreateEchoCommentState.loading(),
    );

    final result = await _feedRepository.createComment(
      comment: comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          createEchoCommentState: CreateEchoCommentState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          createEchoCommentState: CreateEchoCommentState.error(error),
        );
      },
    );
  }

  /// Reacts to the comment.
  ///
  /// The [feedId] is the id of the feed for which the comment is to be reacted.
  ///
  /// The [commentId] is the id of the comment for which the reaction is to be created.
  ///
  /// The [commentOwnerId] is the id of the owner of the comment.
  Future<void> reactToComment({
    required final String feedId,
    required final String commentId,
    required final String commentOwnerId,
  }) async {
    final reaction = PeamanReaction(
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parent: PeamanReactionParent.comment,
      parentId: commentId,
      parentOwnerId: commentOwnerId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    state = state.copyWith(
      reactToEchoCommentState: const ReactToEchoCommentState.loading(),
    );

    final result = await _feedRepository.createReaction(
      reaction: reaction,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          reactToEchoCommentState: ReactToEchoCommentState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          reactToEchoCommentState: ReactToEchoCommentState.error(error),
        );
      },
    );
  }
}
