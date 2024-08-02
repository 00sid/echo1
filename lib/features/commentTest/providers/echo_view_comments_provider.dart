import 'dart:math';

import 'package:echo1/features/commentTest/providers/states/echo_view_comments_provider_state.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/models/peaman_comment_extra_model.dart';

/// Provider of [EchoViewCommentsProvider].
final providerOfEchoViewComments = StateNotifierProvider.autoDispose<
    EchoViewCommentsProvider, EchoViewCommentsProviderState>(
  (ref) => EchoViewCommentsProvider(
    ref: ref,
    state: const EchoViewCommentsProviderState(),
  ),
);

class EchoViewCommentsProvider
    extends StateNotifier<EchoViewCommentsProviderState> {
  /// Handles the business logic for the [ViewCommentsScreen] like fetching comments, posting comments etc.
  EchoViewCommentsProvider({
    required final Ref ref,
    required final EchoViewCommentsProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  PeamanFeedRepository get _feedRepository =>
      _ref.read(providerOfPeamanFeedRepository);
  PeamanUser get _loggedInUser => _ref.read(providerOfLoggedInUser);

  /// Fetches the comments for the feed.
  ///
  /// The [feedId] is the id of the feed for which the comments are to be fetched.
  Future<void> fetchFeedComments({
    required final String feedId,
  }) async {
    state = state.copyWith(
      fetchEchoFeedCommentsState: const FetchEchoFeedCommentsState.loading(),
    );

    final result = await _feedRepository.getComments(
      feedId: feedId,
      parent: PeamanCommentParent.feed,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          fetchEchoFeedCommentsState:
              FetchEchoFeedCommentsState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          fetchEchoFeedCommentsState: FetchEchoFeedCommentsState.error(error),
        );
      },
    );
  }

  /// Posts a comment for the feed.
  ///
  /// The [feedId] is the id of the feed for which the comment is to be posted.
  ///
  /// The [feedOwnerId] is the id of the owner of the feed.
  ///
  /// The [commentText] is the comment to be posted.
  Future<void> postFeedComment({
    required final String feedId,
    required final String feedOwnerId,
    required final String commentText,
  }) async {
    final rand = Random();
    final randomInt = rand.nextInt(1000);

    final comment = PeamanComment(
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parentId: feedId,
      parentOwnerId: feedOwnerId,
      parent: PeamanCommentParent.feed,
      comment: 'Hello World $randomInt',
    );

    state = state.copyWith(
      postFeedCommentState: const PostEchoFeedCommentState.loading(),
    );

    final result = await _feedRepository.createComment(
      comment: comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          postFeedCommentState: PostEchoFeedCommentState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          postFeedCommentState: PostEchoFeedCommentState.error(error),
        );
      },
    );
  }

  /// Posts a comment for another comment. (i.e Reply).
  ///
  /// The [feedId] is the id of the feed for which the comment is to be posted.
  ///
  /// The [commentId] is the id of the comment for which the reply is to be posted.
  ///
  /// The [commentOwnerId] is the id of the owner of the comment.
  ///
  /// The [comment] is the comment to be posted.
  Future<void> postCommentReply({
    required final String feedId,
    required final String commentId,
    required final String commentOwnerId,
    required final String comment,
  }) async {
    final rand = Random();
    final randomInt = rand.nextInt(1000);

    final comment = PeamanComment(
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parentId: commentId,
      parentOwnerId: commentOwnerId,
      parent: PeamanCommentParent.comment,
      comment: 'Hello World $randomInt',
    );

    state = state.copyWith(
      postEchoCommentReplyState: const PostEchoCommentReplyState.loading(),
    );

    final result = await _feedRepository.createComment(
      comment: comment,
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          postEchoCommentReplyState: PostEchoCommentReplyState.success(success),
        );
      },
      (error) {
        state = state.copyWith(
          postEchoCommentReplyState: PostEchoCommentReplyState.error(error),
        );
      },
    );
  }

  /// Adds a new comment in the state.
  ///
  /// The [feedId] is the id of the feed for which the comment is to be added.
  ///
  /// The [feedOwnerId] is the id of the owner of the feed.
  ///
  /// The [commentText] is the comment to be added.
  void addCommentToState({
    required final bool isAudio,
    final String? commentId,
    required final String feedId,
    required final String feedOwnerId,
    final String? commentText,
    final String? audioUrl,
  }) {
    final comment = PeamanComment(
      isAudio: isAudio,
      id: commentId.isNull
          ? PeamanReferenceHelper.ref.collection('random').doc().id
          : commentId,
      feedId: feedId,
      ownerId: _loggedInUser.uid,
      parentId: feedId,
      parentOwnerId: feedOwnerId,
      parent: PeamanCommentParent.feed,
      comment: commentText,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      audioUrl: audioUrl,
      extraData: const PeamanCommentExtraModel(
        isLocal: true,
      ).toJson(),
    );

    final comments = state.fetchEchoFeedCommentsState.when(
      initial: () => <PeamanComment>[],
      loading: () => <PeamanComment>[],
      success: (result) => result,
      error: (error) => <PeamanComment>[],
    );

    state = state.copyWith(
      fetchEchoFeedCommentsState: FetchEchoFeedCommentsState.success(
        [comment, ...comments],
      ),
    );
  }
}
