import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoSearchTextField extends ConsumerWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const EchoSearchTextField(
      {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ), // Adjust the height as needed
        child: Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: context.isDarkMode ? Colors.white70 : AppColor.black,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: context.isDarkMode ? Colors.white70 : AppColor.black,
              ),
              filled: true,
              fillColor: context.isDarkMode ? Colors.grey[800] : AppColor.white,

              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0), // Adjust vertical padding as needed
            ),
            style: TextStyle(
              color: context.isDarkMode ? Colors.white70 : AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
