import 'package:echo1/features/profile/screens/echo_profile_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class ProfileWidget extends ConsumerWidget {
  final String date;
  final PeamanUser user;
  const ProfileWidget({super.key, required this.date, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCurrentUserId = ref.watch(providerOfLoggedInUser).uid;
    final isCurrentUser = user.uid == getCurrentUserId;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: EchoProfileScreen(user: user),
            type: PageTransitionType.scale,
            alignment: Alignment.center,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              //profile image
              user.photo != null
                  ? CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(user.photo!),
                    )
                  : const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                        'assets/images/avatar_unknown.png',
                        package: 'peaman_ui_components',
                      ),
                    ),
              const SizedBox(
                width: 15,
              ),
              //username
              Text(
                isCurrentUser ? "Your Moment" : user.userName!,
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              user.isVerified
                  ? const PeamanVerifiedBadge().pL(16.0)
                  : const SizedBox(),
              const SizedBox(
                width: 5,
              ),
              //date and time ago
              Text(
                date,
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
