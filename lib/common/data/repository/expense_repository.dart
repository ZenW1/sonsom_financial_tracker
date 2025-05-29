import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sonsom_financial_tracker/common/data/model/expense_model.dart';
import 'package:sonsom_financial_tracker/core/api_config.dart';

class ExpenseRepository {
  final CollectionReference _expenseCollection = FirebaseFirestore.instance.collection(AppCollectionKey.budget).doc(AppCollectionKey.expense).parent;

  Future<List<ExpenseModel>> getExpenseData() async {
    final snapshotData = await _expenseCollection.get();
    return snapshotData.docs.map((doc) {
      return ExpenseModel(
        id: doc.id,
        amount: doc['amount'],
        type: doc['type'],
        category: doc['category'],
        note: doc['note'],
        date: doc['date'],
        svgPath: doc['svgPath'],
        svgColor: doc['svgColor'],
        createdAt: doc['createdAt'],
        paymentMethod: doc['paymentMethod'],
      );
    }).toList();
  }

  Future<bool> addExpenseData({
    required ExpenseModel data,
  }) async {
    await _expenseCollection.add(data.toJson());
    return true;
  }

  Future<bool> deleteExpenseData({required String id}) async {
    await _expenseCollection.doc(id).delete();
    return true;
  }

  Future<bool> updateExpenseData({required String id, required ExpenseModel data}) async {
    await _expenseCollection.doc(id).update(data.toJson());
    return true;
  }
}
