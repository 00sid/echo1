import 'package:echo1/features/moment/state/fetch_moments/model/moment_with_user_model.dart';
import 'package:echo1/features/moment/state/fetch_moments/providers/fetch_moments_provider.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:echo1/providers/explore/explore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfAssigningMomentWithUser =
    Provider<List<UserWithMomentModel?>>((ref) {
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
  final List<UserWithMomentModel?> userWithMomentList = [];

  final List<UserWithMomentModel> userWithSortedMomentList = [];
  if (momentList.isNull) {
    userWithSortedMomentList.add(
      UserWithMomentModel(user: currentUser),
    );
    return userWithSortedMomentList;
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
    //sorting moment  currentUser to first if s/he  has moment end
    //sorting moment according to time and isSeen
    for (var userWithMoment in userWithMomentList) {
      List<MomentModel> sortedMomentList = [];

      List<MomentModel> seenMomentList = [];
      List<MomentModel> unseenMomentList = [];
      for (var moment in userWithMoment!.moments!) {
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
      if (userWithSortedMomentList[i]
          .moments![0]
          .seenBy
          .contains(currentUser.uid)) {
        userWithSortedMomentList[i].isTopStorySeen = true;
      } else {
        userWithSortedMomentList[i].isTopStorySeen = false;
      }
    }
    //sorting moment according to  isSeen
    // for (int i = 1; i < userWithSortedMomentList.length; i++) {
    //   if (userWithSortedMomentList[i].isTopStorySeen!) {
    //     UserWithMomentModel user = userWithSortedMomentList.removeAt(i);
    //     userWithSortedMomentList.add(user);
    //   }
    // }

    return userWithSortedMomentList;
  }
});
