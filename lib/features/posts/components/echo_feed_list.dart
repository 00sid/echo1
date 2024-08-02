import 'package:echo1/features/commentTest/views/screens/echo_view_comments_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoFeedList extends ConsumerStatefulWidget {
  const EchoFeedList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EchoFeedListState();
}

class _EchoFeedListState extends ConsumerState<EchoFeedList> {
  @override
  Widget build(BuildContext context) {
    final feedsFuture = ref.watch(providerOfPeamanTimelineFeedsFuture);
    final List<PeamanFeed> feeds = feedsFuture.when(data: (data) {
      final timelineFeeds = ref.watch(
        providerOfPeamanFeed.select((value) => value.timelineFeeds),
      );

      return timelineFeeds;
    }, error: (e, stacktree) {
      return [];
    }, loading: () {
      return [];
    });
    return PeamanFeedsList(
      lastItemPadding: EdgeInsets.only(
        top: 15.h,
        bottom: 100.h,
        left: 20.w,
        right: 20.w,
      ),
      listBuilderByFeeds: (BuildContext, WidgetRef, List) {
        return _feedsListBuilder(
            feeds,
            EdgeInsets.only(
              top: 15.h,
              bottom: 100.h,
              left: 20.w,
              right: 20.w,
            ));
      },
    );
  }

  Widget _feedsListBuilder(
      final List<PeamanFeed> feeds, final EdgeInsets lastItemPadding) {
    return ListView.separated(
      itemCount: feeds.length,
      itemBuilder: (context, index) {
        final feed = feeds[index];
        return PeamanFeedsListItem.byFeed(
          feed: feed,
          padding: index == 0
              ? null
              : index == (feeds.length - 1)
                  ? lastItemPadding
                  : null,
          builder: (context, ref, feed) {
            return Column(
              children: [
                if (feed.type != PeamanFeedType.poll)
                  PeamanFeedItemHeader(feed: feed).pB(15),
                PeamanFeedItemBody(feed: feed).pB(20),
                if (feed.type != PeamanFeedType.poll)
                  PeamanFeedItemActions(
                    feed: feed,
                    shareBuilder: (p0, p1, p2, p3) {
                      return Container();
                    },
                    onPressedComment: (p0, p1, p2, p3) {
                      return onpressComment(feed: feed);
                    },
                  ).pB(10),
              ],
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0.0,
        );
      },
    );
  }

  onpressComment({required final PeamanFeed feed}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EchoViewCommentsScreen(
          feedId: feed.id!, feedOwnerId: feed.ownerId!);
    }));
  }
}
