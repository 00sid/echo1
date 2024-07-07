import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

@immutable
class FetchFollowFollowingUsers {
  Future<List<PeamanSubUser>?> fetchUsersList(
      {required String uid, required String taskName}) async {
    final db = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection(taskName);
    List<PeamanSubUser>? subUserList;

    try {
      final querySnapshot = await db.get();
      final docs = querySnapshot.docs;

      for (var doc in docs) {
        subUserList!.add(
          PeamanSubUser.fromJson(
            doc.data(),
          ),
        );
      }

      return subUserList;
    } catch (e) {
      return subUserList;
    }
  }
}
