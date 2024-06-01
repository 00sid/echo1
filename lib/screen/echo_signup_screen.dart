import 'dart:typed_data';

import 'package:echo1/providers/signup/signup_provider.dart';
import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/utils/app_color.dart';
import 'package:echo1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  Uint8List? _image;

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
        leading: Center(
          child: PeamanRoundIconButton(
            padding: EdgeInsets.all(7.w),
            onPressed: context.pop,
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 16.w,
            ),
          ),
        ),
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
                  // const Center(
                  //   child: PeamanText.heading1(
                  //     "Signup",
                  //   ),
                  // ),

                  //imageGetter

                  _profileImgBuilder(),

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
                      if (passwordController.text.isNotEmpty &&
                          confirmPasswordController.text.isNotEmpty &&
                          lastNameController.text.isNotEmpty &&
                          firstNameController.text.isNotEmpty &&
                          usernameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
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
                              content: Text("Enter password correctly"),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
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

  Widget _profileImgBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          _image != null
              ? CircleAvatar(radius: 64, backgroundImage: MemoryImage(_image!))
              : const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage(
                    'assets/images/avatar_unknown.png',
                    package: 'peaman_ui_components',
                  ),
                ),
          Positioned(
              bottom: -10,
              left: 80,
              child: IconButton(
                onPressed: selectImage,
                icon: const Icon(Icons.add_a_photo),
              ))
        ],
      ),
    );
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
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
}
