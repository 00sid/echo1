// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:echo1/features/moment/state/constants/firebase_collection_name.dart';
// import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final providerOfFetchMoment = StreamProvider<List<MomentModel>>((ref) async* {
//   final DateTime now = DateTime.now();
//   final DateTime twentyFourHoursAgo = now.subtract(const Duration(hours: 24));
//   final snapshot = FirebaseFirestore.instance
//       .collection(FirebaseCollectionName.moments)
//       // .where('createdAt', isGreaterThan: twentyFourHoursAgo)
//       .orderBy("createdAt", descending: true)
//       .snapshots();
//   yield* snapshot.map(
//     (event) => event.docs
//         .map(
//           (doc) => MomentModel.fromJson(
//             doc.data(),
//           ),
//         )
//         .toList(),
//   );
// });
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/features/moment/state/constants/firebase_collection_name.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfFetchMoment = StreamProvider<List<MomentModel>>((ref) async* {
  final DateTime now = DateTime.now();
  final DateTime twentyFourHoursAgo = now.subtract(const Duration(hours: 24));
  final String twentyFourHoursAgoStr = twentyFourHoursAgo.toIso8601String();
  final followingList =
      ref.watch(providerOfPeamanFollowingsStream).asData!.value;
  final List<String> followingIds = followingList.map((e) => e.uid!).toList();

  try {
    final snapshot = FirebaseFirestore.instance
        .collection(FirebaseCollectionName.moments)
        .where(
          'createdAt',
          isGreaterThan: twentyFourHoursAgoStr,
        )
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots();

    yield* snapshot.map((event) {
      // Debug print
      return event.docs.map((doc) {
        final data = doc.data();
        return MomentModel.fromJson(data);
      }).toList();
    });
  } catch (e) {
    // Error handling
    print("Error fetching moments: $e");
    yield [];
  }
});
