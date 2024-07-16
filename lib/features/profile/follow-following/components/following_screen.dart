import 'package:echo1/features/profile/follow-following/components/user_tile.dart';
import 'package:echo1/features/profile/follow-following/providers/current_user/echo_following_user_provider.dart';
import 'package:echo1/features/profile/follow-following/providers/follow_following/following/following_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowingsScreen extends ConsumerStatefulWidget {
  final PeamanUser user;
  const FollowingsScreen({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FollowingsScreenState();
}

class _FollowingsScreenState extends ConsumerState<FollowingsScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final currentUserFollowingList = ref.watch(providerOfFollowingUser);
    final currentUser = ref.watch(providerOfLoggedInUser);
    List<PeamanUser>? allFollowingUsers;
    print("following screen");
    if (currentUser.uid != widget.user.uid) {
      final users = ref.watch(providerOfUserFollowingNotifier);
      allFollowingUsers = users.when(
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
          _searchWidget(controller: controller, context: context),
          currentUser.uid == widget.user.uid
              ? Expanded(
                  child: controller.text.isEmpty
                      ? ListView.builder(
                          itemCount: currentUserFollowingList!.length,
                          itemBuilder: (context, index) {
                            return UserTile(
                              user: currentUserFollowingList[index],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: currentUserFollowingList!
                              .where(
                                (user) =>
                                    user.userName!.toLowerCase().contains(
                                        controller.text.toLowerCase()) ||
                                    user.name!.toLowerCase().contains(
                                          controller.text.toLowerCase(),
                                        ),
                              )
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            final filteredUsers = currentUserFollowingList
                                .where(
                                  (user) =>
                                      user.userName!.toLowerCase().contains(
                                          controller.text.toLowerCase()) ||
                                      user.name!.toLowerCase().contains(
                                            controller.text.toLowerCase(),
                                          ),
                                )
                                .toList();
                            return UserTile(
                              user: filteredUsers[index],
                            );
                          },
                        ),
                )
              : Expanded(
                  child: controller.text.isEmpty
                      ? ListView.builder(
                          itemCount: allFollowingUsers!.length,
                          itemBuilder: (context, index) {
                            return UserTile(
                              user: allFollowingUsers![index],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: allFollowingUsers!
                              .where(
                                (user) =>
                                    user.userName!.toLowerCase().contains(
                                        controller.text.toLowerCase()) ||
                                    user.name!.toLowerCase().contains(
                                          controller.text.toLowerCase(),
                                        ),
                              )
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            final List<PeamanUser> filteredUsers =
                                allFollowingUsers!
                                    .where(
                                      (user) =>
                                          user.userName!.toLowerCase().contains(
                                              controller.text.toLowerCase()) ||
                                          user.name!.toLowerCase().contains(
                                                controller.text.toLowerCase(),
                                              ),
                                    )
                                    .toList();
                            return filteredUsers.isEmpty
                                ? Text("No user found")
                                : UserTile(
                                    user: filteredUsers[index],
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
                vertical: 10.0), // Adjust vertical padding as needed
          ),
          style: TextStyle(
            color: context.isDarkMode ? Colors.white70 : AppColor.black,
          ),
        ),
      ),
    );
  }
}
