import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfFollowingUsers = Provider<List<PeamanUser>>((ref) {
  final followingAsyncList = ref.watch(providerOfPeamanFollowingsStream);

  final List<PeamanSubUser> followingList =
      followingAsyncList.when(data: (following) {
    return following;
  }, error: (error, val) {
    return [];
  }, loading: () {
    return [];
  });
  final asyncUserList = ref.watch(providerOfUsers);
  final usersList = asyncUserList.when(data: (users) {
    return users;
  }, error: (error, val) {
    return [];
  }, loading: () {
    return [];
  });

  final List<PeamanUser> followingUsersList = [];
  for (var user in usersList) {
    for (var following in followingList) {
      if (user.uid == following.uid) {
        followingUsersList.add(user);
      }
    }
  }
  return followingUsersList;
});
