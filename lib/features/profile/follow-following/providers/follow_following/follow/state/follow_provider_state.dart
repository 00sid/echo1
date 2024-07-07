import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part "follow_provider_state.freezed.dart";

@freezed
class FollowProviderState with _$FollowProviderState {
  const factory FollowProviderState.initial() = _FollowProviderStateInitial;
  const factory FollowProviderState.loading() = _FollowProviderStateLoading;
  const factory FollowProviderState.success(
    final List<PeamanUser>? followUsers,
  ) = _FollowProviderStateSuccess;
  const factory FollowProviderState.error(
    final String message,
  ) = _FollowProviderStateError;
}
