import 'dart:typed_data';
import 'package:echo1/features/moment/components/animated_box.dart';
import 'package:echo1/features/moment/state/moment_post/model/moment_result.dart';
import 'package:echo1/features/moment/state/moment_post/providers/moment_state_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

import 'package:peaman_ui_components/peaman_ui_components.dart';

// ignore: must_be_immutable
class EchoCreateMomentScreen extends ConsumerStatefulWidget {
  Uint8List file;
  final List<Color> meshColors;

  EchoCreateMomentScreen(
      {super.key, required this.file, required this.meshColors});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoCreateMomentScreenState();
}

class _EchoCreateMomentScreenState
    extends ConsumerState<EchoCreateMomentScreen> {
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
            image: MemoryImage(widget.file),
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
            'Create Moment',
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
            uploadMoment();
          },
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            size: 24.w,
            color: AppColor.white,
          ),
        ),
      );
  uploadMoment() {
    ref.read(providerOfMomentState.notifier).postMoment(
          userId: ref.watch(providerOfLoggedInUser).uid!,
          file: widget.file,
          createdAt: DateTime.now(),
        );

    if (ref.watch(providerOfMomentState).authResult == MomentResult.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColor.green,
          content: Text('Moment created successfully'),
        ),
      );
    } else if (ref.watch(providerOfMomentState).authResult ==
        MomentResult.failed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Failed to upload. Please try again.',
          ),
        ),
      );
    }

    context.pop();
  }
}
