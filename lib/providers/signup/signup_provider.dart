import 'package:echo1/providers/signup/states/signup_provider_state.dart';
import 'package:echo1/providers/toastmsg/msg_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfSignUp =
    StateNotifierProvider<SignUpProvider, SignUpProviderState>((ref) {
  return SignUpProvider(
    ref: ref,
    state: const SignUpProviderState(),
  );
});

class SignUpProvider extends StateNotifier<SignUpProviderState> {
  SignUpProvider({
    required final Ref ref,
    required final SignUpProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  PeamanAuthRepository get _authRepository =>
      _ref.read(providerOfPeamanAuthRepository);

  Future<void> signUpUser({
    required BuildContext context,
    required final String lName,
    required final String fName,
    required final String userName,
    required final String email,
    required final String password,
    required final String confirmPassword,
    final String? photo,
  }) async {
    List<String> fnameResult = [];
    List<String> lnameResult = [];
    for (int i = 1; i <= fName.length; i++) {
      fnameResult.add(
        fName.substring(0, i).toUpperCase(),
      );
    }
    for (int i = 1; i <= lName.length; i++) {
      lnameResult.add(
        lName.substring(0, i).toUpperCase(),
      );
    }

    final user = PeamanUser(
      name: '$fName $lName',
      userName: userName,
      email: email,
      country: "",
      bio: "",
      dob: 0,
      photo: photo,
      gender: PeamanGender.unknown,
      searchKeys: lnameResult + fnameResult,
    );

    state = state.copyWith(
      signUpUserState: const SignUpUserState.loading(),
    );
    final result = await _authRepository.signUpWithEmailAndPassword(
      user: user,
      email: email,
      password: password,
    );
    if (!mounted) return;

    result.when(
      (success) {
        _ref
            .read(messageProvider.notifier)
            .showSuccess("User created successfully");

        state = state.copyWith(
          signUpUserState: SignUpUserState.success(success),
        );
      },
      (failure) {
        _ref.read(messageProvider.notifier).showError(failure.message);
        state = state.copyWith(
          signUpUserState: SignUpUserState.error(failure),
        );
      },
    );
  }
}
