import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfFollowingUser = Provider<List<PeamanUser>?>((ref) {
  final allUserAsync = ref.watch(providerOfUsers);
  final List<PeamanUser> allUser = allUserAsync.when(data: (data) {
    return data;
  }, error: (err, ss) {
    return [];
  }, loading: () {
    return [];
  });

  final AsyncValue<List<PeamanSubUser>> followingUsersAysnc =
      ref.watch(providerOfPeamanFollowingsStream);
  final List<PeamanSubUser> followingSubUsers =
      followingUsersAysnc.when(data: (data) {
    return data;
  }, error: (err, ss) {
    return [];
  }, loading: () {
    return [];
  });
  List<PeamanUser> followingUsers = [];
  for (var user in allUser) {
    for (var following in followingSubUsers) {
      if (user.uid == following.uid) {
        followingUsers.add(user);
      }
    }
  }

  return followingUsers;
});
