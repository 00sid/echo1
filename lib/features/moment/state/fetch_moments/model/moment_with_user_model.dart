import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class UserWithMomentModel {
  final PeamanUser user;
  final List<MomentModel>? moments;
  bool? isTopStorySeen;

  UserWithMomentModel({
    required this.user,
    this.moments,
    this.isTopStorySeen,
  });
}
