import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/test_model.dart';

class TestRepository {
  final CollectionReference _testCollectionReference = FirebaseFirestore.instance.collection('test');

  final snapShot = FirebaseFirestore.instance.collection('test').snapshots();

  Future<List<TestModel>> getTestData() async {
    final snapshot = await _testCollectionReference.get();

    return snapshot.docs.map((doc) {
      return TestModel(
        name: doc['name'],
        lastName: doc['last-name'],
      );
    }).toList();
  }
}
