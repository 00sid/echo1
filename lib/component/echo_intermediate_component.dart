import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/screen/echo_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoIntermediateScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnboardingCompleted =
        ref.watch(providerOfLoggedInUser).isOnboardingCompleted;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isOnboardingCompleted) {
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const EchoFeedScreen(),
            type: PageTransitionType.fade,
          ),
          (route) => false,
        );
      } else {
        Navigator.push(
          context,
          PageTransition(
            child: const EchoOnboardingScreen(),
            type: PageTransitionType.fade,
          ),
        );
      }
    });

    // While waiting for the navigation decision, show a loading indicator
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
