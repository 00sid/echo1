import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'signup_provider_state.freezed.dart';

@freezed
class SignUpProviderState with _$SignUpProviderState {
  const factory SignUpProviderState({
    @Default(SignUpUserState.initial()) final SignUpUserState signUpUserState,
  }) = _SignUpProviderState;
}

@freezed
class SignUpUserState with _$SignUpUserState {
  const factory SignUpUserState.initial() = _SignUpUserStateInitial;
  const factory SignUpUserState.loading() = _SignUpUserStateLoading;
  const factory SignUpUserState.success(
    final PeamanUser user,
  ) = _SignUpUserStateSuccess;
  const factory SignUpUserState.error(
    final PeamanError error,
  ) = _SignUpUserStateError;
}
