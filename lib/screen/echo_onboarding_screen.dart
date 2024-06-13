import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/component/admins_list.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoOnboardingScreen extends ConsumerStatefulWidget {
  const EchoOnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoOnboardingScreenState();
}

class _EchoOnboardingScreenState extends ConsumerState<EchoOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final loggedInUserId = ref.watch(providerOfLoggedInUser).uid;
    final allAdminList = ref.watch(providerOfAdmins).toList();
    final adminList =
        allAdminList.where((element) => element.uid != loggedInUserId).toList();
    final followingList =
        ref.watch(providerOfPeamanSentFollowRequests).asData?.value;
    final Set<String?> followingUids =
        (followingList ?? []).map((subUser) => subUser.uid).toSet();
    final bool isFollowing =
        adminList.every((admin) => followingUids.contains(admin.uid));

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _screenDescription(isFollowing: isFollowing),
          const AdminList(),
          _nextButton(isFollowing: isFollowing, loggedInUserId: loggedInUserId),
        ],
      ),
    );
  }

  Widget _screenDescription({required bool isFollowing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: isFollowing
          ? const PeamanText.heading4(
              "You can now continue to the app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.green,
              ),
            )
          : const PeamanText.heading4(
              "Follow accounts to see their posts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.green,
              ),
            ),
    );
  }

  Widget _nextButton(
      {required bool isFollowing, required String? loggedInUserId}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isFollowing
          ? PeamanButton.filled(
              value: "Next",
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(loggedInUserId)
                    .update({'is_onboarding_completed': true}).then(
                        (value) => {});
              },
            )
          : PeamanButton.bordered(
              value: "Next",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColor.green,
                    content:
                        Text("Please follow all the accounts to continue."),
                  ),
                );
              },
            ),
    );
  }
}
