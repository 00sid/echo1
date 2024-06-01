import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfUsers = FutureProvider<List<PeamanUser>>(
  (ref) async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    return snapshot.docs.map((doc) => PeamanUser.fromJson(doc.data())).toList();
  },
);
