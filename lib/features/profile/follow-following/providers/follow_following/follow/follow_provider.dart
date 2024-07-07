import 'package:echo1/features/profile/follow-following/providers/follow_following/backend/fetch_follow_following.dart';
import 'package:echo1/features/profile/follow-following/providers/follow_following/follow/state/follow_provider_state.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowNotifier extends StateNotifier<FollowProviderState> {
  FollowNotifier({required final Ref ref})
      : _ref = ref,
        super(
          const FollowProviderState.initial(),
        );
  final Ref _ref;

  Future<void> fetchIndividualFollowers({required String uid}) async {
    final FetchFollowFollowingUsers fetchUsers = FetchFollowFollowingUsers();

    final followedSubUserList =
        await fetchUsers.fetchUsersList(uid: uid, taskName: "followers");
    final allUsersAsync = _ref.watch(providerOfUsers);
    final allUsers = allUsersAsync.when(data: (data) {
      return data;
    }, error: (obj, stackTree) {
      return [];
    }, loading: () {
      return [];
    });
    List<PeamanUser>? followedUsers;
    if (followedSubUserList == null) {
      state = FollowProviderState.initial();
    } else {
      for (var user in allUsers) {
        for (var followingUser in followedSubUserList) {
          if (user.id == followingUser.uid) {
            followedUsers!.add(user);
          }
        }
      }
      state = FollowProviderState.success(followedUsers);
    }
  }
}
