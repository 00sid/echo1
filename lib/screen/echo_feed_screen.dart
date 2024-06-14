import 'package:echo1/features/moment/components/story_profile_box.dart';
import 'package:echo1/screen/echo_explore_screen.dart';
import 'package:echo1/screen/echo_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoFeedScreen extends ConsumerStatefulWidget {
  const EchoFeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EchoFeedScreenState();
}

class _EchoFeedScreenState extends ConsumerState<EchoFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return PeamanTimelineFeedsScreen(headerBuilder: (context, ref) {
      return PeamanTimelineFeedsScreenHeader(
        title: PeamanText.heading4(
          'Echo',
          style: GoogleFonts.caveat(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EchoOnboardingScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
          Center(
            child: PeamanRoundIconButton(
              padding: EdgeInsets.all(7.w),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EchoExploreScreen()));
              },
              icon: Icon(
                Icons.explore,
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.black,
                size: 16.w,
              ),
            ).pR(10.0),
          ),
          Center(
            child: PeamanRoundIconButton(
              padding: EdgeInsets.all(7.w),
              onPressed: () => context.pushNamed(
                PeamanChatsListScreen.route,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/outlined_send_message.svg',
                package: 'peaman_ui_components',
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.black,
                width: 16.w,
              ),
            ).pR(10.0),
          ),
        ],
      );
    }, feedsListBuilder: (context, ref) {
      return RefreshIndicator(
        onRefresh: () async => ref.invalidate(
          providerOfPeamanTimelineFeedsFuture,
        ),
        child: Column(
          children: [
            _momentList(),
            _feedList(),
          ],
        ),
      );
    });
  }

  Widget _momentList() {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return MomentProfileBox(index: index);
          },
        ),
      ),
    );
  }

  Widget _feedList() {
    return Expanded(
      child: PeamanFeedsList(
        lastItemPadding: EdgeInsets.only(
          top: 15.h,
          bottom: 100.h,
          left: 20.w,
          right: 20.w,
        ),
      ),
    );
  }
}
