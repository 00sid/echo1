import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/features/moment/components/animated_box.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoUpdateProfileScreen extends ConsumerStatefulWidget {
  final XFile file;
  final List<Color> meshColors;
  const EchoUpdateProfileScreen({
    super.key,
    required this.file,
    required this.meshColors,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoUpdateProfileScreenState();
}

class _EchoUpdateProfileScreenState
    extends ConsumerState<EchoUpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Hero(
            tag: 'gradient',
            transitionOnUserGestures: true,
            child: AnimatedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: AnimatedMeshGradient(
                colors: widget.meshColors,
                options: AnimatedMeshGradientOptions(
                  amplitude: 30,
                  grain: 0.4,
                  frequency: 5,
                  speed: 2,
                ),
              ),
            ),
          ),
          _image(),
          Positioned(
            top: 20.h,
            left: 20.w,
            child: _heading(),
          ),
          _bottomSheet(),
        ],
      ),
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(
              File(widget.file.path),
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _heading() => Row(
        children: [
          PeamanRoundIconButton(
            bgColor: AppColor.black.withOpacity(0.5),
            padding: EdgeInsets.all(7.w),
            onPressed: context.pop,
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 16.w,
              color: AppColor.white,
            ),
          ),
          SizedBox(
            width: 60.w,
          ),
          PeamanText.heading4(
            'Update Profile',
            style: GoogleFonts.caveat().copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
        ],
      );

  Widget _bottomSheet() => Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
          bottom: 8.0,
        ),
        child: PeamanRoundIconButton(
          bgColor: AppColor.green,
          padding: EdgeInsets.all(20.w),
          onPressed: () {
            updateProfile();
          },
          icon: Icon(
            Icons.check_rounded,
            size: 24.w,
            color: AppColor.white,
          ),
        ),
      );

  updateProfile() async {
    final currentUser = ref.watch(providerOfLoggedInUser);
    final storageRepository = ref.read(
      providerOfPeamanStorageRepository,
    );
    final randomId = PeamanReferenceHelper.ref.collection('random').doc().id;
    final fileName = '$randomId.jpg';

    String? image;

    final imageState = await storageRepository.uploadFile(
      path: '/users/$randomId/profile_image',
      fileName: fileName,
      file: File(widget.file.path),
    );
    image = imageState.when(
      (success) => success,
      (failure) => null,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({
      'photo': image,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile Updated Successfully'),
        ),
      );

      context.pop();
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update profile'),
        ),
      );
      context.pop();
    });
  }
}
