import 'package:echo1/providers/forget_password/forgot_password_provider.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:echo1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoForgotPasswordScreen extends ConsumerStatefulWidget {
  const EchoForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoForgetPasswordScreenState();
}

class _EchoForgetPasswordScreenState
    extends ConsumerState<EchoForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _headerBuilder(),
      body: _bodyBuilder(),
    );
  }

  PreferredSizeWidget _headerBuilder() {
    return AppBar(
      title: PeamanText.heading4(
        "Forgot Password",
        style: GoogleFonts.caveat().copyWith(color: AppColor.white),
      ),
      centerTitle: true,
      backgroundColor: AppColor.green,
    );
  }

  Widget _bodyBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //email
          PeamanInput(
            hintText: "Email",
            controller: _emailController,
          ),
          //note
          const Text(
            "Please enter your email address correctly. You will receive a link to create a new password via email.",
            style: TextStyle(
              color: AppColor.green,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          //button
          PeamanButton.filled(
            onPressed: () async {
              await forgotPassword();
            },
            value: "Reset Password",
            valueStyle: const TextStyle(
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }

  forgotPassword() async {
    if (_emailController.text.trim().isNotEmpty) {
      await ref
          .read(providerOfForgotPasswordNotifier.notifier)
          .forgotPassword(
            email: _emailController.text.trim(),
          )
          .whenComplete(() {
        showAlertMessage(context, "Password reset link sent to your email");
      });
      _emailController.clear();
    } else {
      showAlertMessage(context, "Please enter your email address");
    }
  }
}
