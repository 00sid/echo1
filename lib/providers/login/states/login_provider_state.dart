import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'login_provider_state.freezed.dart';

@freezed
class LoginProviderState with _$LoginProviderState {
  const factory LoginProviderState({
    @Default(LoginUserState.initial()) final LoginUserState loginUserState,
  }) = _LoginProviderState;
}

@freezed
class LoginUserState with _$LoginUserState {
  const factory LoginUserState.initial() = _LoginUserStateInitial;
  const factory LoginUserState.loading() = _LoginUserStateLoading;
  const factory LoginUserState.success(
    final PeamanUser user,
  ) = _LoginUserStateSuccess;
  const factory LoginUserState.error(
    final PeamanError error,
  ) = _LoginUserStateError;
}
