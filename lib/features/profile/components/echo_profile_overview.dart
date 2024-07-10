import 'package:echo1/features/profile/components/echo_profile_basic_detals_overview.dart';
import 'package:echo1/features/profile/components/echo_profile_count_details_overview.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoProfileOverview extends ConsumerStatefulWidget {
  final PeamanUser user;
  const EchoProfileOverview({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoProfileOverviewState();
}

class _EchoProfileOverviewState extends ConsumerState<EchoProfileOverview> {
  @override
  Widget build(BuildContext context) {
    return PeamanProfileOverview(
      user: widget.user,
      countDetailsOverviewBuilder: (context, ref, user) {
        return EchoProfileCountDetailsOverview(
          user: widget.user,
        );
      },
      basicDetailsOverviewBuilder: (context, ref, user) {
        return EchoProfileBasicDetailsOverview(user: widget.user);
      },
    );
  }
}
