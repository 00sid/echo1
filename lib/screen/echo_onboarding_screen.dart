import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/component/admins_list.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          _screenDescription(
            isFollowing: isFollowing,
            context: context,
          ),
          const AdminList(),
          _nextButton(
              isFollowing: isFollowing,
              loggedInUserId: loggedInUserId,
              context: context),
        ],
      ),
    );
  }

  Widget _screenDescription(
      {required bool isFollowing, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: isFollowing
          ? PeamanText.heading4(
              "You can now continue to the app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.isDarkMode ? AppColor.white : AppColor.green,
              ),
            )
          : PeamanText.heading4(
              "Follow accounts to see their posts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.isDarkMode ? AppColor.white : AppColor.green,
              ),
            ),
    );
  }

  Widget _nextButton(
      {required bool isFollowing,
      required String? loggedInUserId,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isFollowing
          ? PeamanButton.filled(
              color: context.isDarkMode ? AppColor.white : AppColor.green,
              value: "Next",
              valueStyle: TextStyle(
                color: context.isDarkMode ? AppColor.green : AppColor.white,
              ),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(loggedInUserId)
                    .update({'is_onboarding_completed': true}).then((value) => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                  child: const EchoFeedScreen(),
                                  type: PageTransitionType.fade),
                              (route) => false)
                        });
              },
            )
          : PeamanButton.bordered(
              value: "Next",
              valueStyle: const TextStyle(
                color: AppColor.green,
              ),
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
