import 'package:echo1/features/moment/components/story_list.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/fetch_moments_provider.dart';
import 'package:echo1/features/profile/screens/echo_profile_screen.dart';
import 'package:echo1/screen/echo_explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoFeedScreen extends ConsumerStatefulWidget {
  const EchoFeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EchoFeedScreenState();
}

class _EchoFeedScreenState extends ConsumerState<EchoFeedScreen> {
  List<PeamanSubUser>? allUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(providerOfLoggedInUser);

    return PeamanTimelineFeedsScreen(
      headerBuilder: (context, ref) {
        return PeamanTimelineFeedsScreenHeader(
          title: PeamanText.heading4(
            'Echo',
            style: GoogleFonts.caveat(),
          ),
          leading: currentUser.photo == null
              ? Center(
                  child: GestureDetector(
                  // onTap: () => context.pushNamed(
                  //   PeamanProfileScreen.route,
                  //   arguments: PeamanProfileScreenArgs(
                  //     userId: currentUser.uid!,
                  //   ),
                  // ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EchoProfileScreen(
                          user: currentUser,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 33,
                    width: 33,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/avatar_unknown.png',
                          package: 'peaman_ui_components',
                        ),
                      ),
                    ),
                  ),
                ))
              : Center(
                  child: PeamanAvatarBuilder.network(
                    currentUser.photo,
                    size: 33.0,
                    // onPressed: () => context.pushNamed(
                    //   PeamanProfileScreen.route,
                    //   arguments: PeamanProfileScreenArgs(
                    //     userId: currentUser.uid!,
                    //   ),
                    // ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EchoProfileScreen(
                            user: currentUser,
                          ),
                        ),
                      );
                    },
                  ),
                ),
          actions: [
            Center(
              child: PeamanRoundIconButton(
                padding: EdgeInsets.all(7.w),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EchoExploreScreen(),
                    ),
                  );
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
      },
      feedsListBuilder: (context, ref) {
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(
              providerOfPeamanTimelineFeedsFuture,
            );
            ref.invalidate(providerOfFetchMoment);
          },
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: _momentList(),
              ),
              Expanded(
                flex: 5,
                child: _feedList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _momentList() {
    return const SizedBox(
      child: StoryList(),
    );
  }

  Widget _feedList() {
    return PeamanFeedsList(
      lastItemPadding: EdgeInsets.only(
        top: 15.h,
        bottom: 100.h,
        left: 20.w,
        right: 20.w,
      ),
    );
  }
}
