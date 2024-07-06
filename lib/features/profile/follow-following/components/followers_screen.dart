import 'package:echo1/features/profile/follow-following/components/user_tile.dart';
import 'package:echo1/features/profile/follow-following/providers/echo_follower_user_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowersScreen extends ConsumerStatefulWidget {
  const FollowersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FollowersScreenState();
}

class _FollowersScreenState extends ConsumerState<FollowersScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allFollowerUsers = ref.watch(providerOfFollowerUser);
    return Scaffold(
      body: Column(
        children: [
          _searchWidget(
            controller: controller,
            context: context,
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: allFollowerUsers!.length,
          //     itemBuilder: (context, index) {
          //       return UserTile(
          //         user: allFollowerUsers[index],
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: controller.text.isEmpty
                ? ListView.builder(
                    itemCount: allFollowerUsers!.length,
                    itemBuilder: (context, index) {
                      return UserTile(
                        user: allFollowerUsers[index],
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: allFollowerUsers!
                        .where(
                          (user) =>
                              user.userName!
                                  .toLowerCase()
                                  .contains(controller.text.toLowerCase()) ||
                              user.name!.toLowerCase().contains(
                                    controller.text.toLowerCase(),
                                  ),
                        )
                        .length,
                    itemBuilder: (context, index) {
                      final filteredUsers = allFollowerUsers.where(
                        (user) =>
                            user.userName!
                                .contains(controller.text.toLowerCase()) ||
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
        child: Expanded(
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
      ),
    );
  }
}
