import 'package:echo1/features/moment/state/moment_post/model/moment_state.dart';
import 'package:echo1/features/moment/state/moment_post/notifiers/moment_state_notifier.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfMomentState =
    StateNotifierProvider<MomentStateNotifier, MomentState>((_) {
  return MomentStateNotifier();
});
