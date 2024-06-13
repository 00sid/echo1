import 'dart:typed_data';

import 'package:echo1/screen/echo_create_moment_screen.dart';
import 'package:echo1/screen/echo_story_page.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

// ignore: must_be_immutable
class MomentProfileBox extends ConsumerStatefulWidget {
  final int index;
  bool isSeen;
  MomentProfileBox({super.key, required this.index, this.isSeen = true});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MomentProfileBoxState();
}

class _MomentProfileBoxState extends ConsumerState<MomentProfileBox> {
  @override
  Widget build(BuildContext context) {
    final getProfileImage = ref.watch(providerOfLoggedInUser).photo;
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                _navigateToDetailScreen(context, details.globalPosition);
              },
              child: Container(
                margin:
                    EdgeInsets.only(right: 5, left: widget.index == 0 ? 10 : 0),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: widget.index == 0 ? null : Colors.grey,
                  shape: BoxShape.circle,
                  image: widget.index == 0
                      ? DecorationImage(
                          image: NetworkImage(getProfileImage!),
                          scale: 1,
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage(
                            'assets/images/avatar_unknown.png',
                            package: 'peaman_ui_components',
                          ),
                        ),
                  border: Border.all(
                    color: widget.isSeen
                        ? Colors.grey.shade600.withOpacity(0.5)
                        : AppColor.brightGreen,
                    width: 3,
                  ),
                ),
              ),
            ),
            widget.index == 0
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        _selectImage(context);
                        // Navigator.push(

                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => EchoCreateMomentScreen(),
                        //   ),
                        // );
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
          widget.index == 0 ? "Your Story" : "User ${widget.index}",
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _navigateToDetailScreen(BuildContext context, Offset tapPosition) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EchoMomentScreen(
          index: widget.index,
        ),
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
            title: PeamanText.heading4(
              'Select Image',
              style: GoogleFonts.caveat().copyWith(
                color: Colors.black,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EchoCreateMomentScreen(
                          file: file,
                        ),
                      ),
                    );
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Icon(
                      Icons.photo_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Choose from gallery",
                    ),
                  ],
                ),
                onPressed: () async {
                  Uint8List? file = await pickImage(ImageSource.gallery);

                  if (file != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EchoCreateMomentScreen(
                          file: file,
                        ),
                      ),
                    );
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  children: [
                    Icon(
                      Icons.cancel_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
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
