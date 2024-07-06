import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoProfileBasicDetailsOverview extends ConsumerStatefulWidget {
  final PeamanUser user;
  const EchoProfileBasicDetailsOverview({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoProfileBasicDetailsOverviewState();
}

class _EchoProfileBasicDetailsOverviewState
    extends ConsumerState<EchoProfileBasicDetailsOverview> {
  @override
  Widget build(BuildContext context) {
    return PeamanProfileBasicDetailsOverview(
      user: widget.user,
      avatarBuilder: (context, ref, user) {
        return user.photo == null
            ? PeamanAvatarBuilder.asset(
                'assets/images/avatar_unknown.png',
                package: "peaman_ui_components",
                size: 100.w,
              ).pB(10)
            : PeamanAvatarBuilder.network(
                user.photo,
                size: 100.w,
                userId: user.uid,
              ).pB(10);
      },
    );
  }
}
