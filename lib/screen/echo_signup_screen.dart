import 'dart:io';

import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:echo1/providers/signup/signup_provider.dart';
import 'package:echo1/screen/echo_onboarding_screen.dart';
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

  XFile? _image;

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
    final usersAsyncValue = ref.watch(providerOfUsers);
    // final users = usersAsyncValue.asData!.value;
    final users = usersAsyncValue.when(data: (data) {
      return data;
    }, error: (error, stack) {
      return [];
    }, loading: () {
      return [];
    }) as List<PeamanUser>;
    List<String> userNames =
        users.map((e) => e.userName!.toLowerCase()).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: PeamanText.heading4(
          'SignUp',
          style: GoogleFonts.caveat().copyWith(
            color: AppColor.white,
          ),
        ),
        backgroundColor: AppColor.green,
        leading: Center(
          child: PeamanRoundIconButton(
            padding: EdgeInsets.all(7.w),
            onPressed: context.pop,
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 16.w,
              color: AppColor.white,
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
                    onPressed: () async {
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
                        if (userNames.contains(username.toLowerCase())) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Username already exists. Please try another one.",
                              ),
                            ),
                          );
                        } else {
                          if (passwordController.text.trim() ==
                              confirmPasswordController.text.trim()) {
                            final storageRepository = ref.read(
                              providerOfPeamanStorageRepository,
                            );
                            final randomId = PeamanReferenceHelper.ref
                                .collection('random')
                                .doc()
                                .id;
                            final fileName = '$randomId.jpg';

                            String? image;
                            if (_image != null) {
                              final imageState =
                                  await storageRepository.uploadFile(
                                path: '/users/$randomId/profile_image',
                                fileName: fileName,
                                file: File(_image!.path),
                              );
                              image = imageState.when(
                                (success) => success,
                                (failure) => null,
                              );
                            }

                            ref.read(providerOfSignUp.notifier).signUpUser(
                                  lName: lastName,
                                  fName: firstName,
                                  userName: username,
                                  email: email,
                                  password: password,
                                  photo: image,
                                  confirmPassword: confirmPassword,
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Enter password correctly"),
                              ),
                            );
                          }
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
                  const SizedBox(
                    height: 10.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PeamanText.subtitle1(
                        "Already a member? ",
                        style: TextStyle(
                          color: AppColor.green,
                          fontSize: 16,
                        ),
                      ),
                      PeamanText.button(
                        "Login",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor.green,
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
                      child: const EchoOnboardingScreen(),
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
              ? CircleAvatar(
                  radius: 64,
                  backgroundImage: FileImage(
                    File(_image!.path),
                  ),
                )
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
    final im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Future<XFile?> pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return file;
    }
    return null;
  }
}
