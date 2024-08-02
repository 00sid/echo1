import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class PostAudio {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> postAudio(
      {required File file,
      required String feedId,
      required String commentId}) async {
    String? downloadUrl;
    try {
      // Ensure the file exists
      if (!file.existsSync()) {
        throw "File does not exist";
      }

      // Upload the file to Firebase Storage
      String fileName = file.uri.pathSegments.last;
      Reference ref = _storage
          .ref()
          .child('audio/')
          .child(feedId)
          .child('$commentId/$fileName');
      UploadTask uploadTask = ref.putFile(file);

      // Get the downloadable URL
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      downloadUrl = await snapshot.ref.getDownloadURL();

      // Store the URL in Firestore
      return downloadUrl;
    } catch (e) {
      print(e);
      return downloadUrl;
    }
  }
}
