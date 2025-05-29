import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sonsom_financial_tracker/common/data/model/income_model.dart';
import 'package:sonsom_financial_tracker/core/api_config.dart';

class IncomeRepository {
  final CollectionReference _incomeCollectionReference = FirebaseFirestore.instance.collection(AppCollectionKey.budget).doc(AppCollectionKey.income).parent;

  Future<List<IncomeModel>> getIncomeRecord() async {
    final snapshot = await _incomeCollectionReference.get();
    return snapshot.docs.map((doc) {
      return IncomeModel(
        amount: doc['amount'],
        category: doc['category'],
        note: doc['note'],
        account: doc['account'],
        svgPath: doc['svgPath'],
        svgColor: doc['svgColor'],
        type: doc['type'],
        date: doc['date'],
        createdAt: DateTime.parse(doc['createdAt']),
      );
    }).toList();
  }

  Future<bool> addIncomeRecord({required IncomeModel data}) async {
    await _incomeCollectionReference.add(data.toMap());
    return true;
  }

  Future<bool> deleteIncomeRecord({required String id}) async {
    await _incomeCollectionReference.doc(id).delete();
    return true;
  }

  Future<bool> updateIncomeRecord({required String id, required IncomeModel data}) async {
    await _incomeCollectionReference.doc(id).update(data.toMap());
    return true;
  }
}
