import 'package:echo1/features/moment/components/story_list_box.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/assign_moment_with_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class StoryList extends ConsumerStatefulWidget {
  const StoryList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MomentListState();
}

class _MomentListState extends ConsumerState<StoryList> {
  @override
  Widget build(BuildContext context) {
    final usersWithMomentList = ref.watch(providerOfAssigningMomentWithUser);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: usersWithMomentList.length,
        itemBuilder: (context, index) {
          return StoryListBox(
            userWithMoment: usersWithMomentList[index]!,
          );
        },
      ),
    );
  }
}
