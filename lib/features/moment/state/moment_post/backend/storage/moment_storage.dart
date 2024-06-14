import 'dart:typed_data';

import 'package:echo1/features/moment/state/constants/firebase_collection_name.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MomentStorage {
  final momentStorage = FirebaseStorage.instance
      .ref()
      .child(FirebaseCollectionName.momentStorage);
  Future<String?> storeMomentPic(
      {required String userId,
      required Uint8List file,
      required String momentId}) async {
    try {
      UploadTask uploadTask =
          momentStorage.child(userId).child(momentId).putData(file);
      TaskSnapshot snap = await uploadTask;
      String downloadURL = await snap.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      return null;
    }
  }
}
