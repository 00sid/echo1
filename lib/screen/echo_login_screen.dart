import 'package:echo1/component/echo_intermediate_component.dart';
import 'package:echo1/providers/login/login_provider.dart';
import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/screen/echo_forgot_password_screen.dart';
import 'package:echo1/screen/echo_onboarding_screen.dart';
import 'package:echo1/screen/echo_signup_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoLoginScreen extends ConsumerStatefulWidget {
  const EchoLoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoLoginScreenState();
}

class _EchoLoginScreenState extends ConsumerState<EchoLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenToLoginState();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.green,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //app logo
              Container(
                height: 160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.contain),
                ),
              ),

              //email
              PeamanInput(
                hintText: "Email",
                controller: emailController,
              ),

              PeamanInput(
                hintText: "Password",
                controller: passwordController,
                password: true,
              ),

              PeamanButton.filled(
                isLoading: ref
                    .watch(
                      providerOfLogin.select(
                        (value) => value.loginUserState,
                      ),
                    )
                    .maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                value: 'Login',
                valueStyle: TextStyle(
                  color: context.isDarkMode ? AppColor.black : AppColor.black,
                ),
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  if (email.isNotEmpty && password.isNotEmpty) {
                    ref
                        .read(providerOfLogin.notifier)
                        .loginUser(email: email, password: password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all the fields"),
                      ),
                    );
                  }
                },
                color: AppColor.white,
              ),
              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member?",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child: const EchoSignUpScreen(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              //forgot password
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EchoForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenToLoginState() {
    ref.listen(
      providerOfLogin.select(
        (value) => value.loginUserState,
      ),
      (previous, next) {
        if (previous != next) {
          next.maybeWhen(
            success: (_) {
              // ref.watch(providerOfLoggedInUser).isOnboardingCompleted
              //     ? Navigator.pushAndRemoveUntil(
              //         context,
              //         PageTransition(
              //             child: const EchoFeedScreen(),
              //             type: PageTransitionType.fade),
              //         (route) => false)
              //     : Navigator.push(
              //         context,
              //         PageTransition(
              //           child: const EchoOnboardingScreen(),
              //           type: PageTransitionType.fade,
              //         ),
              //       );
              Navigator.push(
                context,
                PageTransition(
                  child: EchoIntermediateScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            orElse: () {},
          );
        }
      },
    );
  }
}
