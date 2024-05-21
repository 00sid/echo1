import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfForgotPasswordNotifier =
    StateNotifierProvider<ForgotPasswordNotifier, String>((ref) {
  return ForgotPasswordNotifier(
    email: '',
    ref: ref,
  );
});

class ForgotPasswordNotifier extends StateNotifier<String> {
  ForgotPasswordNotifier({
    required final String email,
    required final Ref ref,
  })  : _ref = ref,
        super(email);
  final Ref _ref;
  PeamanAuthRepository get _authRepository =>
      _ref.read(providerOfPeamanAuthRepository);
  Future<void> forgotPassword({required final String email}) async {
    await _authRepository.sendPasswordResetEmail(email: email);
  }
}
