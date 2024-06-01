import 'package:echo1/component/users_list_in_explore.dart';
import 'package:echo1/screen/echo_user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoExploreScreen extends ConsumerStatefulWidget {
  const EchoExploreScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoExploreScreenState();
}

class _EchoExploreScreenState extends ConsumerState<EchoExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const UsersInExplore(),
    );
  }

  PreferredSizeWidget _appBar() {
    return PeamanAppbar(
      title: PeamanText.heading4(
        'Explore',
        style: GoogleFonts.caveat(),
      ),
      leading: Center(
        child: PeamanRoundIconButton(
          padding: EdgeInsets.all(7.w),
          onPressed: context.pop,
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 16.w,
          ),
        ),
      ),
      actions: [
        Center(
          child: PeamanRoundIconButton(
            padding: EdgeInsets.all(7.w),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EchoUserSearchScreen();
              }));
            },
            icon: SvgPicture.asset(
              'assets/svgs/outlined_search.svg',
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
  }
}
