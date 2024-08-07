import 'dart:io';

import 'package:echo1/features/moment/components/gradient_utils.dart';
import 'package:echo1/features/profile/components/echo_update_profile_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
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
  List<Color>? meshColors;

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(providerOfLoggedInUser);
    return PeamanProfileBasicDetailsOverview(
      user: widget.user,
      avatarBuilder: (context, ref, user) {
        return Stack(
          alignment: Alignment.center,
          children: [
            widget.user.uid == currentUser.uid
                ? currentUser.photo == null
                    ? PeamanAvatarBuilder.asset(
                        'assets/images/avatar_unknown.png',
                        package: "peaman_ui_components",
                        size: 100.w,
                      ).pB(10)
                    : PeamanAvatarBuilder.network(
                        currentUser.photo,
                        size: 100.w,
                        userId: user.uid,
                      ).pB(10)
                : user.photo == null
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
                onPressed: () async {
                  XFile? file = await pickImage(
                    ImageSource.camera,
                  );
                  if (file != null) {
                    meshColors = await generateMeshGradientFromImage(
                      FileImage(
                        File(file.path),
                      ),
                    );

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EchoUpdateProfileScreen(
                          file: file,
                          meshColors: meshColors!,
                        ),
                      ),
                    );
                  }
                },
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
                onPressed: () async {
                  XFile? file = await pickImage(
                    ImageSource.gallery,
                  );
                  if (file != null) {
                    meshColors = await generateMeshGradientFromImage(
                      FileImage(
                        File(file.path),
                      ),
                    );

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EchoUpdateProfileScreen(
                          file: file,
                          meshColors: meshColors!,
                        ),
                      ),
                    );
                  }
                },
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

  Future<XFile?> pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return file;
    }
    return null;
  }
}
