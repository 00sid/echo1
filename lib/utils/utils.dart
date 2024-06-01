import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';

showAlertMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: AppColor.green,
    ),
  );
}
