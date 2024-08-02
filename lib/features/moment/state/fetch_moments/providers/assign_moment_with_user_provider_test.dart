import 'package:echo1/features/moment/state/fetch_moments/model/moment_with_user_model.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/fetch_moments_provider.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/following_list_provider.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfAssigningMomentWithUserTest =
    Provider<List<UserWithMomentModel?>>(
  (ref) {
    final currentUser = ref.watch(providerOfLoggedInUser);
    final asyncMomentList = ref.watch(providerOfFetchMoment);
    final momentList = asyncMomentList.when(data: (moment) {
      return moment;
    }, error: (error, val) {
      return null;
    }, loading: () {
      return null;
    });
    final asyncUserList = ref.watch(providerOfUsers);
    final usersList = asyncUserList.when(data: (users) {
      return users;
    }, error: (error, val) {
      return [];
    }, loading: () {
      return [];
    });
    final List<PeamanUser> followingUsersList =
        ref.watch(providerOfFollowingUsers);
    List<UserWithMomentModel> userWithMomentList = [];
    List<UserWithMomentModel> filteredUserWithMomentList = [];

    if (momentList.isNull) {
      return userWithMomentList;
    } else {
      //assigning moment with user
      for (var user in usersList) {
        final List<MomentModel> userMoments = [];
        for (var moment in momentList!) {
          if (moment.userId == user.uid) {
            userMoments.add(moment);
          }
        }
        if (userMoments.isNotEmpty) {
          userWithMomentList.add(UserWithMomentModel(
            user: user,
            moments: userMoments,
          ));
        }
        //assigning moment end
      }

      // //updating isTopStorySeen
      // for (var userWithMoment in userWithMomentList) {
      //   for (var moment in userWithMoment.moments!) {
      //     if (moment.seenBy.contains(currentUser.uid)) {
      //       userWithMoment.isTopStorySeen = true;
      //     } else {
      //       userWithMoment.isTopStorySeen = false;
      //     }
      //   }
      // }
      //filtering the following users
      for (PeamanUser user in followingUsersList) {
        for (UserWithMomentModel userWithMoment in userWithMomentList) {
          if (user.uid == userWithMoment.user.uid) {
            filteredUserWithMomentList.add(userWithMoment);
          }
        }
      }

      return filteredUserWithMomentList;
    }
  },
);
