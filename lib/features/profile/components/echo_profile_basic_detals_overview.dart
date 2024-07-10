import 'package:echo1/utils/app_color.dart';
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
    final currentUser = ref.watch(providerOfLoggedInUser);
    return PeamanProfileBasicDetailsOverview(
      user: widget.user,
      avatarBuilder: (context, ref, user) {
        return Stack(
          alignment: Alignment.center,
          children: [
            user.photo == null
                ? PeamanAvatarBuilder.asset(
                    'assets/images/avatar_unknown.png',
                    package: "peaman_ui_components",
                    size: 100.w,
                  ).pB(10)
                : PeamanAvatarBuilder.network(
                    user.photo,
                    size: 100.w,
                    userId: user.uid,
                  ).pB(10),
            widget.user.uid == currentUser.uid
                ? Positioned(
                    bottom: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () {
                        _selectImage(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.green,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  void _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Center(
              child: PeamanText.heading4(
                'Change Profile Picture',
                style: GoogleFonts.caveat().copyWith(
                  color: context.isDarkMode ? AppColor.white : Colors.black,
                ),
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      color: context.isDarkMode ? AppColor.white : Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Take a photo",
                    ),
                  ],
                ),
                onPressed: () async {},
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_rounded,
                      color: context.isDarkMode ? AppColor.white : Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Choose from gallery",
                    ),
                  ],
                ),
                onPressed: () async {},
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.cancel_rounded,
                      color: context.isDarkMode ? AppColor.white : Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Cancel",
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
