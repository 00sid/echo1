// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:peaman_ui_components/peaman_ui_components.dart';

// class FetchFollowFollowingUsers {
//   Future<List<PeamanSubUser>> fetchUsersList(
//       {required String uid, required String taskName}) async {
//     final db = FirebaseFirestore.instance
//         .collection("users")
//         .doc(uid)
//         .collection(taskName);
//     List<PeamanSubUser> subUserList = [];

//     try {
//       final querySnapshot = await db.get();
//       final docs = querySnapshot.docs;

//       for (var doc in docs) {
//         subUserList.add(
//           PeamanSubUser.fromJson(
//             doc.data(),
//           ),
//         );
//       }

//       return subUserList;
//     } catch (e) {
//       print("daksjjdsajkdsaj: $e");

//       return subUserList;
//       // return subUserList;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class FetchFollowFollowingUsers {
  Future<List<PeamanSubUser>> fetchUsersList({
    required String uid,
    required String taskName,
  }) async {
    final db = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection(taskName);
    List<PeamanSubUser> subUserList = [];

    try {
      final querySnapshot = await db.get();
      final docs = querySnapshot.docs;

      for (var doc in docs) {
        // Check if doc.data() is not null
        final data = doc.data();
        // ignore: unnecessary_null_comparison
        if (data != null) {
          subUserList.add(
            PeamanSubUser.fromJson(data),
          );
        } else {
          return subUserList;
        }
      }

      return subUserList;
    } catch (e) {
      print("Error fetching users list: $e");
      return subUserList;
    }
  }
}
