import 'package:echo1/component/verified_icon.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class AdminList extends ConsumerStatefulWidget {
  const AdminList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminListState();
}

class _AdminListState extends ConsumerState<AdminList> {
  @override
  Widget build(BuildContext context) {
    final loggedInUserId = ref.watch(providerOfLoggedInUser).uid;
    final allAdminList = ref.watch(providerOfAdmins).toList();
    final adminList =
        allAdminList.where((element) => element.uid != loggedInUserId).toList();
    final followingList =
        ref.watch(providerOfPeamanSentFollowRequests).asData?.value;

    return Expanded(
      child: ListView.builder(
        itemCount: adminList.length,
        itemBuilder: (context, index) {
          final user = adminList[index];
          final bool isFollowing = followingList!
              .where((element) => element.uid == user.uid)
              .isNotEmpty;
          return _userTile(user: user, isFollowing: isFollowing);
        },
      ),
    );
  }

  Widget _userTile({required PeamanUser user, required isFollowing}) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          user.photo != null
              ? CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                    user.photo!,
                  ),
                )
              : const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(
                    'assets/images/avatar_unknown.png',
                    package: 'peaman_ui_components',
                  ),
                ),
          user.isVerified ? const VerifiedIcon() : const SizedBox(),
        ],
      ),
      title: Text(
        user.name!,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "@${user.userName!}",
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 14.0,
        ),
      ),
      trailing: isFollowing
          ? PeamanButton.bordered(
              width: 100,
              value: 'Following',
              onPressed: () {},
            )
          : PeamanButton.filled(
              width: 100,
              value: 'Follow',
              color: AppColor.white,
              onPressed: () {
                _onPressedFollow(user: user);
              },
            ),
    );
  }

  void _onPressedFollow({required PeamanUser user}) {
    ref.watch(providerOfPeamanUser.notifier).performFollowAction(
          userId: user.uid!,
          followSuccessLogMessage:
              'Follow request has been sent to ${user.name}',
          unfollowSuccessLogMessage: '${user.name} has been unfollowed',
          cancelfollowRequestSuccessLogMessage:
              'Follow request has been canceled',
          acceptFollowRequestSuccessLogMessage:
              'Follow request has been accepted',
          followBackSuccessLogMessage: '${user.name} has been followed',
        );
  }
}
