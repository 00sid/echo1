import 'dart:typed_data';

import 'package:echo1/features/moment/screens/echo_create_moment_screen.dart';
import 'package:echo1/features/moment/screens/story_page.dart';
import 'package:echo1/features/moment/state/fetch_moments/model/moment_with_user_model.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

// ignore: must_be_immutable
class StoryListBox extends ConsumerStatefulWidget {
  final UserWithMomentModel userWithMoment;

  const StoryListBox({
    super.key,
    required this.userWithMoment,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MomentProfileBoxState();
}

class _MomentProfileBoxState extends ConsumerState<StoryListBox> {
  bool isCurrentUser = false;
  @override
  Widget build(BuildContext context) {
    final getCurrentUserId = ref.watch(providerOfLoggedInUser).uid;
    if (widget.userWithMoment.user.uid == getCurrentUserId) {
      isCurrentUser = true;
    }

    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                if (widget.userWithMoment.moments.isNull) {
                  return;
                } else {
                  _navigateToDetailScreen(context, details.globalPosition);
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 5,
                  left: isCurrentUser ? 10 : 0,
                ),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: widget.userWithMoment.user.photo.isNull
                      ? const DecorationImage(
                          image: AssetImage(
                            'assets/images/avatar_unknown.png',
                            package: 'peaman_ui_components',
                          ),
                        )
                      : DecorationImage(
                          image: NetworkImage(
                            widget.userWithMoment.user.photo!,
                          ),
                          scale: 1,
                          fit: BoxFit.cover,
                        ),
                  border: Border.all(
                    color: widget.userWithMoment.isTopStorySeen.isNull ||
                            widget.userWithMoment.isTopStorySeen!
                        ? Colors.grey.shade500
                        : AppColor.brightGreen,
                    width: 3,
                  ),
                ),
              ),
            ),
            isCurrentUser
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        _selectImage(context);
                      },
                      icon: const Center(
                        child: Icon(
                          Icons.add,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Text(
          isCurrentUser ? "Your Story" : widget.userWithMoment.user.userName!,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _navigateToDetailScreen(
    BuildContext context,
    Offset tapPosition,
  ) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StoryPage(userWithMoment: widget.userWithMoment),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final screenSize = MediaQuery.of(context).size;

          final tappedX = tapPosition.dx / screenSize.width;
          final tappedY = tapPosition.dy / screenSize.height;

          return Stack(
            children: [
              Positioned.fill(
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      tappedX * screenSize.width,
                      tappedY * screenSize.height,
                    )
                    ..scale(animation.value)
                    ..translate(
                      -tappedX * screenSize.width,
                      -tappedY * screenSize.height,
                    ),
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Center(
              child: PeamanText.heading4(
                'Select Image',
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
                  Uint8List? file = await pickImage(
                    ImageSource.camera,
                  );
                  if (file != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EchoCreateMomentScreen(file: file),
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
                  Uint8List? file = await pickImage(ImageSource.gallery);

                  if (file != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EchoCreateMomentScreen(file: file),
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
}

pickImage(ImageSource source) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final ImagePicker _imagePicker = ImagePicker();
  // ignore: no_leading_underscores_for_local_identifiers
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  // ignore: avoid_print
  print("NO image selected");
}
