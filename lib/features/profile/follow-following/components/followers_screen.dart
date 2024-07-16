import 'package:echo1/features/profile/follow-following/components/user_tile.dart';
import 'package:echo1/features/profile/follow-following/providers/current_user/echo_follower_user_provider.dart';
import 'package:echo1/features/profile/follow-following/providers/follow_following/follow/follow_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowersScreen extends ConsumerStatefulWidget {
  final PeamanUser user;
  const FollowersScreen({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FollowersScreenState();
}

class _FollowersScreenState extends ConsumerState<FollowersScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserFollowersList = ref.watch(providerOfFollowerUser);
    final currentUser = ref.watch(providerOfLoggedInUser);
    List<PeamanUser>? allFollowedUsers;
    if (currentUser.uid != widget.user.uid) {
      final users = ref.watch(providerOfUserFollowNotifier);
      allFollowedUsers = users.when(
          initial: () => [],
          loading: () => [],
          success: (data) {
            return data;
          },
          error: (msj) {
            return [];
          });
    }

    return Scaffold(
      body: Column(
        children: [
          _searchWidget(
            controller: controller,
            context: context,
          ),
          widget.user.uid == currentUser.uid
              ? Expanded(
                  child: controller.text.isEmpty
                      ? ListView.builder(
                          itemCount: currentUserFollowersList!.length,
                          itemBuilder: (context, index) {
                            return UserTile(
                              user: currentUserFollowersList[index],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: currentUserFollowersList!
                              .where(
                                (user) =>
                                    user.userName!.toLowerCase().contains(
                                        controller.text.toLowerCase()) ||
                                    user.name!.toLowerCase().contains(
                                          controller.text.toLowerCase(),
                                        ),
                              )
                              .length,
                          itemBuilder: (context, index) {
                            final filteredUsers =
                                currentUserFollowersList.where(
                              (user) =>
                                  user.userName!.contains(
                                      controller.text.toLowerCase()) ||
                                  user.name!.toLowerCase().contains(
                                        controller.text.toLowerCase(),
                                      ),
                            );
                            return UserTile(
                              user: filteredUsers.elementAt(index),
                            );
                          },
                        ),
                )
              : Expanded(
                  child: controller.text.isEmpty
                      ? ListView.builder(
                          itemCount: allFollowedUsers?.length,
                          itemBuilder: (context, index) {
                            return UserTile(
                              user: allFollowedUsers![index],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: allFollowedUsers!
                              .where(
                                (user) =>
                                    user.userName!.toLowerCase().contains(
                                        controller.text.toLowerCase()) ||
                                    user.name!.toLowerCase().contains(
                                          controller.text.toLowerCase(),
                                        ),
                              )
                              .length,
                          itemBuilder: (context, index) {
                            final filteredUsers = allFollowedUsers!.where(
                              (user) =>
                                  user.userName!.contains(
                                      controller.text.toLowerCase()) ||
                                  user.name!.toLowerCase().contains(
                                        controller.text.toLowerCase(),
                                      ),
                            );
                            return UserTile(
                              user: filteredUsers.elementAt(index),
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }

  Widget _searchWidget({
    required TextEditingController controller,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ), // Adjust the height as needed
        child: TextField(
          controller: controller,
          onChanged: (val) {
            setState(() {});
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: context.isDarkMode ? Colors.white70 : AppColor.black,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: context.isDarkMode ? Colors.white70 : AppColor.black,
            ),
            filled: true,
            fillColor: context.isDarkMode ? Colors.grey[800] : AppColor.white,

            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ), // Adjust vertical padding as needed
          ),
          style: TextStyle(
            color: context.isDarkMode ? Colors.white70 : AppColor.black,
          ),
        ),
      ),
    );
  }
}
