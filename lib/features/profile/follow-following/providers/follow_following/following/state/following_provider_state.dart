import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'following_provider_state.freezed.dart';

@freezed
class FollowingProviderState with _$FollowingProviderState {
  const factory FollowingProviderState.initial() =
      _FollowingProviderStateInitial;
  const factory FollowingProviderState.loading() =
      _FollowingProviderStateLoading;
  const factory FollowingProviderState.success(
    final List<PeamanUser>? followingUsers,
  ) = _FollowingProviderStateSuccess;
  const factory FollowingProviderState.error(
    final String message,
  ) = _FollowingProviderStateError;
}
