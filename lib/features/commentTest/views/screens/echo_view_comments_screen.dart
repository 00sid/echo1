import 'package:echo1/features/commentTest/providers/echo_view_comments_provider.dart';
import 'package:echo1/features/commentTest/views/widgets/echo_comments_list.dart';
import 'package:echo1/features/commentTest/views/widgets/echo_comment_input.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoViewCommentsScreenArgs {
  final String feedId;
  final String feedOwnerId;

  const EchoViewCommentsScreenArgs({
    required this.feedId,
    required this.feedOwnerId,
  });
}

class EchoViewCommentsScreen extends ConsumerStatefulWidget {
  /// Displays the list of comments for a feed.
  const EchoViewCommentsScreen({
    super.key,
    required this.feedId,
    required this.feedOwnerId,
  });

  /// The id of the feed for which the comments are to be displayed.
  final String feedId;

  /// The id of the owner of the feed.
  final String feedOwnerId;

  static const route = '/peaman_view_comments';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoViewCommentsScreenState();
}

class _EchoViewCommentsScreenState
    extends ConsumerState<EchoViewCommentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
  }

  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this widget
    ref.watch(providerOfEchoViewComments.select((value) => null));

    return Scaffold(
      appBar: PeamanAppbar(
        title: PeamanText.heading4(
          'Comments',
          style: GoogleFonts.caveat(),
        ),
      ),
      body: EchoCommentsList.comment(
        feedId: widget.feedId,
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: EchoCommentInput(
          feedId: widget.feedId,
          feedOwnerId: widget.feedOwnerId,
        ),
      ),
    ).keyboardDismisser(context);
  }

  void _onInit() {
    ref
        .read(providerOfEchoViewComments.notifier)
        .fetchFeedComments(feedId: widget.feedId);
  }
}
