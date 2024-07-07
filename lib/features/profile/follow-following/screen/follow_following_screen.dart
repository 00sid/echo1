import 'package:echo1/features/profile/follow-following/components/followers_screen.dart';
import 'package:echo1/features/profile/follow-following/components/following_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowerFollowingScreen extends ConsumerStatefulWidget {
  const FollowerFollowingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FollowerFollowingScreenState();
}

class _FollowerFollowingScreenState
    extends ConsumerState<FollowerFollowingScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(providerOfLoggedInUser);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PeamanAppbar(
          title: Text(
            "@${currentUser.userName}",
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
                  text: '${currentUser.followersCount} followers',
                ),
                Tab(
                  text: "${currentUser.followingCount} following",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  FollowersScreen(),
                  FollowingsScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
