import 'package:echo1/features/profile/follow-following/providers/follow_following/backend/fetch_follow_following.dart';
import 'package:echo1/features/profile/follow-following/providers/follow_following/following/state/following_provider_state.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FollowingNotifier extends StateNotifier<FollowingProviderState> {
  FollowingNotifier({required final Ref ref})
      : _ref = ref,
        super(
          const FollowingProviderState.initial(),
        );
  final Ref _ref;

  Future<void> fetchIndividualFollowing({required String uid}) async {
    final FetchFollowFollowingUsers fetchUsers = FetchFollowFollowingUsers();

    final followingSubUserList =
        await fetchUsers.fetchUsersList(uid: uid, taskName: "followings");
    final allUsersAsync = _ref.watch(providerOfUsers);
    final allUsers = allUsersAsync.when(data: (data) {
      return data;
    }, error: (obj, stackTree) {
      return [];
    }, loading: () {
      return [];
    });
    List<PeamanUser>? followingUsers;
    if (followingSubUserList == null) {
      state = FollowingProviderState.initial();
    } else {
      for (var user in allUsers) {
        for (var followingUser in followingSubUserList) {
          if (user.id == followingUser.uid) {
            followingUsers!.add(user);
          }
        }
      }
      state = FollowingProviderState.success(followingUsers);
    }
  }
}
