import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/features/moment/state/constants/firebase_collection_name.dart';

class UpdateSeen {
  final db =
      FirebaseFirestore.instance.collection(FirebaseCollectionName.moments);
  Future<void> updateSeen(
      {required String momentId, required String userId}) async {
    try {
      await db.doc(momentId).update(
        {
          'seenBy': FieldValue.arrayUnion(
            [userId],
          ),
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
