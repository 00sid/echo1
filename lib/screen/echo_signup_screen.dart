import 'package:echo1/providers/signup/signup_provider.dart';
import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:echo1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class EchoSignUpScreen extends ConsumerStatefulWidget {
  const EchoSignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EchoSignUpScreenState();
}

class _EchoSignUpScreenState extends ConsumerState<EchoSignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listenToSignUpState();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.green,
      ),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //logo
                  const Center(
                    child: PeamanText.heading1(
                      "Signup",
                    ),
                  ),

                  PeamanInput(
                    hintText: "Last Name",
                    controller: lastNameController,
                  ),

                  PeamanInput(
                    hintText: "First Name",
                    controller: firstNameController,
                  ),
                  //username
                  PeamanInput(
                    hintText: "Username",
                    controller: usernameController,
                  ),

                  //email
                  PeamanInput(
                    hintText: "Email",
                    controller: emailController,
                  ),

                  //password
                  PeamanInput(
                    hintText: "Password",
                    controller: passwordController,
                    password: true,
                  ),

                  //confirm password
                  PeamanInput(
                    hintText: "Confirm Password",
                    controller: confirmPasswordController,
                    password: true,
                  ),

                  //signup
                  PeamanButton.filled(
                    value: "SignUp",
                    isLoading: ref
                        .watch(
                          providerOfSignUp.select(
                            (value) => value.signUpUserState,
                          ),
                        )
                        .maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        ),
                    valueStyle: const TextStyle(
                      color: AppColor.white,
                    ),
                    onPressed: () {
                      final lastName = lastNameController.text.trim();
                      final firstName = firstNameController.text.trim();
                      final username = usernameController.text.trim();
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      final confirmPassword =
                          confirmPasswordController.text.trim();
                      if (passwordController.text.trim() ==
                          confirmPasswordController.text.trim()) {
                        ref.read(providerOfSignUp.notifier).signUpUser(
                              lName: lastName,
                              fName: firstName,
                              userName: username,
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword,
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Enter password correctly")));
                      }
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PeamanText.subtitle1(
                        "Already a member?",
                      ),
                      PeamanText.button(
                        "Login",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenToSignUpState() {
    ref.listen(
      providerOfSignUp.select(
        (value) => value.signUpUserState,
      ),
      (previous, next) {
        if (previous != next) {
          next.maybeWhen(
            success: (_) {
              // Navigator.pushReplacementNamed(
              //   context,
              //   PeamanTimelineFeedsScreen.route,
              // );
              showAlertMessage(context, "Account created successfully");
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                      child: const EchoFeedScreen(),
                      type: PageTransitionType.fade),
                  (route) => false);
            },
            orElse: () {},
          );
        }
      },
    );
  }
}
