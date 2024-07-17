import 'package:echo1/features/moment/components/story_widget.dart';
import 'package:echo1/features/moment/state/fetch_moments/model/moment_with_user_model.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/assign_moment_with_following_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoryPage extends ConsumerStatefulWidget {
  final UserWithMomentModel userWithMoment;
  const StoryPage({super.key, required this.userWithMoment});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryPageState();
}

class _StoryPageState extends ConsumerState<StoryPage> {
  late PageController controller;
  int? initialPage;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with a dummy initial page
    controller = PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Now it is safe to use ref.watch
    getInitialPage();
  }

  @override
  Widget build(BuildContext context) {
    final List<UserWithMomentModel> usersWithMomentList =
        ref.watch(providerOfMomentWithFollowingUser);
    return PageView(
      controller: controller,
      children: usersWithMomentList
          .map((user) => StoryWidget(
                userWithMoment: user,
                controller: controller,
              ))
          .toList(),
    );
  }

  void getInitialPage() {
    final usersWithMomentList = ref.watch(providerOfMomentWithFollowingUser);

    for (int i = 0; i < usersWithMomentList.length; i++) {
      if (usersWithMomentList[i].user.uid == widget.userWithMoment.user.uid) {
        initialPage = i;
        controller = PageController(initialPage: initialPage!);
        break;
      }
    }
  }
}
