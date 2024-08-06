import 'package:echo1/features/commentTest/providers/echo_comments_list_item_provider.dart';
import 'package:echo1/features/commentTest/providers/echo_view_comments_provider.dart';
import 'package:echo1/features/commentTest/views/widgets/echo_comments_list_item.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoCommentsList extends ConsumerStatefulWidget {
  /// Displays the list of comments for a feed.
  const EchoCommentsList.comment({
    super.key,
    required this.feedId,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
  })  : parent = PeamanCommentParent.feed,
        comment = const PeamanComment();

  /// Displays the list of replies for a comment.
  const EchoCommentsList.reply({
    super.key,
    required this.feedId,
    required this.comment,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
  }) : parent = PeamanCommentParent.comment;

  /// The id of the feed for which the comments are to be displayed.
  final String feedId;

  /// If the comments are for a feed then the parent is [PeamanCommentParent.feed].
  /// If the comments are for a comment (reply) then the parent is [PeamanCommentParent.comment].
  final PeamanCommentParent parent;

  /// If the comments are for a comment (reply) then the comment is required.
  final PeamanComment comment;

  /// If true, the list will shrink-wrap its children.
  final bool shrinkWrap;

  /// The physics for the list.
  final ScrollPhysics physics;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoCommentsListState();
}

class _EchoCommentsListState extends ConsumerState<EchoCommentsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.parent == PeamanCommentParent.feed) {
      final fetchCommentsState = ref.watch(
        providerOfEchoViewComments.select(
          (value) => value.fetchEchoFeedCommentsState,
        ),
      );

      return fetchCommentsState.maybeWhen(
        loading: () => _loadingBuilder(),
        success: (comments) =>
            comments.isNotEmpty ? _listBuilder(comments) : _emptyBuilder(),
        error: (error) => _emptyBuilder(),
        orElse: () => const SizedBox(),
      );
    } else {
      final fetchCommentRepliesState = ref.watch(
        providerOfEchoCommentsListItemProvider(widget.comment.id!).select(
          (value) => value.fetchCommentsReplyState,
        ),
      );

      return fetchCommentRepliesState.maybeWhen(
        loading: () => _loadingBuilder(),
        success: (comments) =>
            comments.isNotEmpty ? _listBuilder(comments) : _emptyBuilder(),
        error: (error) => _emptyBuilder(),
        orElse: () => const SizedBox(),
      );
    }
  }

  Widget _loadingBuilder() {
    return const PeamanSpinner();
  }

  Widget _emptyBuilder() {
    return const PeamanEmptyBuilder(
      title: "No comments found!",
      subTitle: 'Be the first one to express your thoughts...',
    );
  }

  Widget _listBuilder(final List<PeamanComment> comments) {
    return ListView.builder(
      itemCount: comments.length,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return EchoCommentsListItem(
          comment: comment,
        ).pT(index == 0 ? 20.0 : 0.0);
      },
    );
  }
}
