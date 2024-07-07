import 'package:echo1/features/moment/state/fetch_moments/model/moment_with_user_model.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/assign_moment_with_user_provider_test.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/following_list_provider.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfMomentWithFollowingUser =
    Provider<List<UserWithMomentModel>>((ref) {
  final List<UserWithMomentModel> userWithSortedMomentList = [];

  final currentUser = ref.watch(providerOfLoggedInUser);
  final userWithMomentList = ref.watch(providerOfAssigningMomentWithUserTest);

  final List<PeamanUser> followingUsersList =
      ref.watch(providerOfFollowingUsers);

  if (userWithMomentList.isEmpty) {
    userWithSortedMomentList.add(UserWithMomentModel(user: currentUser));
  } else {
    //sorting moment  currentUser to first if s/he  has moment
    for (var i = 0; i < userWithMomentList.length; i++) {
      var userWithMoment = userWithMomentList[i];
      if (userWithMoment!.user.uid == currentUser.uid) {
        final UserWithMomentModel currentUserWithMoment = userWithMoment;
        if (i >= 0) {
          userWithMomentList.removeAt(i);
        }
        userWithMomentList.insert(0, currentUserWithMoment);
        break;
      }
    }
    if (userWithMomentList[0]!.user.uid != currentUser.uid) {
      userWithMomentList.insert(
        0,
        UserWithMomentModel(user: currentUser),
      );
    }
    //following user with moment
    // for (var user in followingUsersList) {
    //   for (var userWithMoment in userWithMomentList) {
    //     if (user.uid == userWithMoment!.user.uid ||
    //         user.uid == currentUser.uid) {
    //       followingUserWithMomentList.add(userWithMoment);
    //     }
    //   }
    // }

    //sorting moment  currentUser to first if s/he  has moment end
    //sorting moment according to time and isSeen
    for (var userWithMoment in userWithMomentList) {
      List<MomentModel> sortedMomentList = [];

      List<MomentModel> seenMomentList = [];
      List<MomentModel> unseenMomentList = [];
      for (var moment in (userWithMoment!.moments ?? <MomentModel>[])) {
        if (moment.seenBy.contains(currentUser.uid)) {
          seenMomentList.add(moment);
        } else {
          unseenMomentList.add(moment);
        }
      }
      sortedMomentList.addAll(unseenMomentList);
      sortedMomentList.addAll(seenMomentList);
      seenMomentList = [];
      unseenMomentList = [];

      userWithSortedMomentList.add(UserWithMomentModel(
        user: userWithMoment.user,
        moments: sortedMomentList,
      ));
      sortedMomentList = [];
    }
    for (int i = 0; i < userWithSortedMomentList.length; i++) {
      if (userWithSortedMomentList[i].moments?.isNotEmpty ?? false) {
        if (userWithSortedMomentList[i]
            .moments![0]
            .seenBy
            .contains(currentUser.uid)) {
          userWithSortedMomentList[i].isTopStorySeen = true;
        } else {
          userWithSortedMomentList[i].isTopStorySeen = false;
        }
      }
    }
    //sorting moment according to  isSeen
    for (int i = 1; i < userWithSortedMomentList.length - 1; i++) {
      if (userWithSortedMomentList[i].isTopStorySeen!) {
        UserWithMomentModel user = userWithSortedMomentList.removeAt(i);
        userWithSortedMomentList.add(user);
      }
    }
  }

  return userWithSortedMomentList;
});
