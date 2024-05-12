import 'package:echo1/providers/login/states/login_provider_state.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfLogin =
    StateNotifierProvider<LoginProvider, LoginProviderState>((ref) {
  return LoginProvider(
    ref: ref,
    state: const LoginProviderState(),
  );
});

class LoginProvider extends StateNotifier<LoginProviderState> {
  LoginProvider({
    required final Ref ref,
    required final LoginProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  PeamanAuthRepository get _authRepository =>
      _ref.read(providerOfPeamanAuthRepository);

  Future<void> loginUser({
    required final String email,
    required final String password,
  }) async {
    state = state.copyWith(
      loginUserState: const LoginUserState.loading(),
    );
    final result = await _authRepository.signInWithEmailAndPassword(
        email: email, password: password);
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          loginUserState: LoginUserState.success(success as PeamanUser),
        );
      },
      (failure) {
        state = state.copyWith(
          loginUserState: LoginUserState.error(failure),
        );
      },
    );
  }
}
