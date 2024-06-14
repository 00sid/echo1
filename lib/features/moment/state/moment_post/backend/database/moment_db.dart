import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/features/moment/state/constants/firebase_collection_name.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:echo1/features/moment/state/moment_post/backend/storage/moment_storage.dart';
import 'package:echo1/features/moment/state/moment_post/model/moment_result.dart';
import 'package:uuid/uuid.dart';

class MomentDb {
  MomentDb();
  final db =
      FirebaseFirestore.instance.collection(FirebaseCollectionName.moments);

  Future<MomentResult> postMoment({
    required String userId,
    required Uint8List file,
    required DateTime createdAt,
  }) async {
    final storage = MomentStorage();
    final momentId = Uuid().v4();
    try {
//get image url
      String? imageUrl = await storage.storeMomentPic(
        userId: userId,
        file: file,
        momentId: momentId,
      );
      if (imageUrl == null) {
        return MomentResult.failed;
      }
      //store in db
      await db.doc(momentId).set(
            MomentModel(
              momentId: momentId,
              userId: userId,
              imageUrl: imageUrl,
              createdAt: createdAt,
              seenBy: [],
              likes: [],
            ).toJson(),
          );

      return MomentResult.success;
    } catch (e) {
      return MomentResult.failed;
    }
  }
}
