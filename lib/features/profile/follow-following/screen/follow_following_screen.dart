import 'package:echo1/features/profile/follow-following/components/followers_screen.dart';
import 'package:echo1/features/profile/follow-following/components/following_screen.dart';
import 'package:echo1/features/profile/follow-following/providers/follow_following/follow/follow_provider.dart';
import 'package:echo1/features/profile/follow-following/providers/follow_following/following/following_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowerFollowingScreen extends ConsumerStatefulWidget {
  final int index;
  final PeamanUser user;

  const FollowerFollowingScreen({
    super.key,
    required this.index,
    required this.user,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FollowerFollowingScreenState();
}

class _FollowerFollowingScreenState
    extends ConsumerState<FollowerFollowingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    setIndividualFollowerFollowingData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PeamanAppbar(
          title: Text(
            "@${widget.user.userName}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        // backgroundColor: context.isDarkMode ? AppColor.black : Colors.white,
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: context.isDarkMode ? AppColor.white : AppColor.black,
              unselectedLabelColor: context.isDarkMode
                  ? AppColor.white
                  : AppColor.black.withOpacity(0.7),
              unselectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal, // Normal text when unselected
              ),
              dividerColor: AppColor.white,
              labelStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              indicatorColor:
                  context.isDarkMode ? AppColor.white : AppColor.black,
              tabs: [
                Tab(
                  text:
                      '${widget.user.followersCount} ${widget.user.followersCount > 1 ? "followers" : "follower"}',
                ),
                Tab(
                  text:
                      "${widget.user.followingCount} ${widget.user.followingCount > 1 ? "followings" : "following"}",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FollowersScreen(
                    user: widget.user,
                  ),
                  FollowingsScreen(
                    user: widget.user,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  setIndividualFollowerFollowingData() {
    final currentUser = ref.watch(providerOfLoggedInUser);
    if (widget.user.uid != currentUser.uid) {
      ref
          .read(providerOfUserFollowNotifier.notifier)
          .fetchIndividualFollowers(uid: widget.user.uid!);
      ref
          .read(providerOfUserFollowingNotifier.notifier)
          .fetchIndividualFollowing(uid: widget.user.uid!);
    }
  }
}
