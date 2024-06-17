import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo1/features/moment/state/constants/firebase_collection_name.dart';
import 'package:echo1/features/moment/state/moment_info/models/moment_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerOfFetchMoment = StreamProvider<List<MomentModel>>((ref) async* {
  final snapshot = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.moments)
      .orderBy("createdAt", descending: true)
      .snapshots();
  yield* snapshot.map(
    (event) => event.docs
        .map(
          (doc) => MomentModel.fromJson(
            doc.data(),
          ),
        )
        .toList(),
  );
});
