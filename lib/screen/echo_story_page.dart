import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EchoMomentScreen extends ConsumerStatefulWidget {
  const EchoMomentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoMomentScreenState();
}

class _EchoMomentScreenState extends ConsumerState<EchoMomentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
    );
  }
}
