import 'package:echo1/providers/toastmsg/msg_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void listenForMessage(BuildContext context, WidgetRef ref) {
  ref.listen<MessageState?>(messageProvider, (previous, next) {
    if (next!.message != null && next.type != null) {
      final snackBar = SnackBar(
        content: Row(
          children: [
            Icon(
              next.type == MessageType.error ? Icons.error_outline : null,
              color: AppColor.white,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                next.message!,
                style: const TextStyle(
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor:
            next.type == MessageType.error ? AppColor.red : AppColor.green,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'DISMISS',
          textColor: AppColor.white,
          onPressed: () {
            // Clear the error when dismissed
            ref.read(messageProvider.notifier).clearMessage();
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((_) {
        // Automatically clear the message once the SnackBar closes
        ref.read(messageProvider.notifier).clearMessage();
      });
      ref.read(messageProvider.notifier).clearMessage();
    }
  });
}
