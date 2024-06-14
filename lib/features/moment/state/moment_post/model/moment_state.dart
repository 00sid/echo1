import 'package:echo1/features/moment/state/moment_post/model/moment_result.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class MomentState {
  final MomentResult? authResult;
  final bool isLoading;

  const MomentState({
    required this.authResult,
    required this.isLoading,
  });
  const MomentState.unknown()
      : authResult = null,
        isLoading = false;

  MomentState copiedWithIsLoading(bool isLoading) => MomentState(
        authResult: authResult,
        isLoading: isLoading,
      );

  @override
  bool operator ==(covariant MomentState other) =>
      identical(this, other) ||
      authResult == other.authResult && isLoading == other.isLoading;

  @override
  int get hashCode => Object.hash(
        authResult,
        isLoading,
      );
}
