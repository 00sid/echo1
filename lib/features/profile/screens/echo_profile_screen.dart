import 'package:echo1/features/profile/components/echo_profile_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoProfileScreen extends ConsumerStatefulWidget {
  final PeamanUser user;
  const EchoProfileScreen({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoProfileScreenState();
}

class _EchoProfileScreenState extends ConsumerState<EchoProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return PeamanProfileScreen(
      userId: widget.user.uid!,
      overviewBuilder: (context, ref, user) =>
          EchoProfileOverview(user: widget.user),
    );
  }
}
