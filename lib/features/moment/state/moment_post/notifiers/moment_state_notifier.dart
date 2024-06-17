import 'dart:typed_data';

import 'package:echo1/features/moment/state/moment_post/backend/database/moment_db.dart';
import 'package:echo1/features/moment/state/moment_post/model/moment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MomentStateNotifier extends StateNotifier<MomentState> {
  final _momentDb = MomentDb();
  MomentStateNotifier() : super(const MomentState.unknown());
  Future<void> postMoment({
    required String userId,
    required Uint8List file,
    required DateTime createdAt,
  }) async {
    state = state.copiedWithIsLoading(true);
    final result = await _momentDb.postMoment(
      userId: userId,
      file: file,
      createdAt: createdAt,
    );
    state = MomentState(
      authResult: result,
      isLoading: false,
    );
  }
}
