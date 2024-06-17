import 'package:echo1/component/verified_icon.dart';
import 'package:echo1/features/moment/state/fetch_moments/backend/update_seen.dart';
import 'package:echo1/features/moment/state/fetch_moments/model/moment_with_user_model.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/assign_moment_with_user_provider.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryWidget extends ConsumerStatefulWidget {
  final UserWithMomentModel userWithMoment;
  final PageController controller;
  const StoryWidget({
    super.key,
    required this.userWithMoment,
    required this.controller,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends ConsumerState<StoryWidget> {
  final storyItems = <StoryItem>[];
  late StoryController controller;
  String date = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = StoryController();
    addStoryItems();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  bool isCurrentUser = false;

  @override
  Widget build(BuildContext context) {
    final getCurrentUserId = ref.watch(providerOfLoggedInUser).uid;
    if (widget.userWithMoment.user.uid == getCurrentUserId) {
      isCurrentUser = true;
    }

    return Stack(
      children: <Widget>[
        Material(
          type: MaterialType.transparency,
          child: StoryView(
            storyItems: storyItems,
            controller: controller,
            onComplete: handleCompleted,
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                Navigator.pop(context);
              }
            },
            onStoryShow: (storyItem) async {
              final index = storyItems.indexOf(storyItem);

              // if (index > 0) {
              //   setState(() {
              //     date = widget.user.stories[index].date;
              //   });
              // }
              await updateSeen(
                momentId: widget.userWithMoment.moments![index].momentId,
                userId: getCurrentUserId!,
              );
            },
          ),
        ),
        //profile image
        Positioned(
          top: 30,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  //profile image
                  widget.userWithMoment.user.photo != null
                      ? CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              NetworkImage(widget.userWithMoment.user.photo!),
                        )
                      : const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(
                            'assets/images/avatar_unknown.png',
                            package: 'peaman_ui_components',
                          ),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  //username
                  Text(
                    isCurrentUser
                        ? "Your Story"
                        : widget.userWithMoment.user.userName!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  widget.userWithMoment.user.isVerified
                      ? const VerifiedIcon()
                      : const SizedBox(),
                  const SizedBox(
                    width: 5,
                  ),
                  //date and time ago
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  addStoryItems() {
    for (MomentModel moment in widget.userWithMoment.moments!) {
      storyItems.add(
        StoryItem.pageImage(
          url: moment.imageUrl,
          controller: controller,
          duration: const Duration(
            milliseconds: 2500,
          ),
        ),
      );
    }
  }

  void handleCompleted() {
    final usersWithMomentList = ref.watch(providerOfAssigningMomentWithUser);
    widget.controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    final currentIndex = usersWithMomentList.indexOf(widget.userWithMoment);
    final isLastPage = usersWithMomentList.length - 1 == currentIndex;

    if (isLastPage) {
      Navigator.of(context).pop();
    }
  }

  updateSeen({required String momentId, required String userId}) async {
    await UpdateSeen().updateSeen(momentId: momentId, userId: userId);
  }
}
