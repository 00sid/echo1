// import 'package:echo1/features/profile/follow-following/screen/follow_following_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:peaman_ui_components/peaman_ui_components.dart';

// class EchoProfileCountDetailsOverview extends ConsumerStatefulWidget {
//   final PeamanUser user;
//   const EchoProfileCountDetailsOverview({super.key, required this.user});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _EchoProfileCountDetailsOverviewState();
// }

// class _EchoProfileCountDetailsOverviewState
//     extends ConsumerState<EchoProfileCountDetailsOverview> {
//   @override
//   Widget build(BuildContext context) {
//     return PeamanProfileCountDetailsOverview(
//       user: widget.user,
//       onPressedFollowersCount: (context, ref, user, onPressed) {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return const FollowerFollowingScreen();
//         }));
//       },
//       onPressedFollowingsCount: (context, ref, user, onPressed) {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return const FollowerFollowingScreen();
//         }));
//       },
//     );
//   }

// }
import 'package:echo1/features/profile/follow-following/screen/follow_following_screen.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoProfileCountDetailsOverview extends ConsumerStatefulWidget {
  final PeamanUser user;
  const EchoProfileCountDetailsOverview({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoProfileCountDetailsOverviewState();
}

class _EchoProfileCountDetailsOverviewState
    extends ConsumerState<EchoProfileCountDetailsOverview> {
  @override
  Widget build(BuildContext context) {
    return PeamanProfileCountDetailsOverview(
      user: widget.user,
      onPressedFollowersCount: (context, ref, user, onPressed) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FollowerFollowingScreen();
        }));
      },
      onPressedFollowingsCount: (context, ref, user, onPressed) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FollowerFollowingScreen();
        }));
      },
    );
  }
}
