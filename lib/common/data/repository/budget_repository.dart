import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonsom_financial_tracker/common/data/model/expense_model.dart';
import 'package:sonsom_financial_tracker/core/api_config.dart';

import '../model/income_model.dart';

class BudgetRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final String userId = FirebaseAuth.instance.currentUser!.uid;

  // Fetch incomes for a specific month
  Future<List<IncomeModel>> getIncomes(int year, int month) async {
    DateTime startDate = DateTime(year, month);
    DateTime endDate = DateTime(year, month + 1);

    QuerySnapshot snapshot = await _firestore
        .collection(AppCollectionKey.income)
        // .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('date', isLessThan: Timestamp.fromDate(endDate))
        .get();

    return snapshot.docs.map((doc) {
      return IncomeModel(
        amount: doc['amount'],
        category: doc['category'],
        date: doc['date'].toDate(),
        note: doc['note'] ?? '',
        account: doc['account'] ?? '',
        svgPath: doc['svgPath'] ?? '',
        svgColor: doc['svgColor'] ?? '',
        type: doc['type'] ?? '',
        createdAt: doc['createdAt']?.toDate() ?? DateTime.now(),
      );
    }).toList();
  }

  // Fetch expenses for a specific month
  Future<List<ExpenseModel>> getExpenses(int year, int month) async {
    DateTime startDate = DateTime(year, month);
    DateTime endDate = DateTime(year, month + 1);

    QuerySnapshot snapshot = await _firestore
        .collection(AppCollectionKey.expense)
        // .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('date', isLessThan: Timestamp.fromDate(endDate))
        .get();

    return snapshot.docs.map((doc) {
      return ExpenseModel(
        id: doc.id,
        amount: doc['amount'],
        type: doc['type'],
        category: doc['category'],
        note: doc['note'] ?? '',
        date: doc['date'].toDate(),
        svgPath: doc['svgPath'] ?? '',
        svgColor: doc['svgColor'] ?? '',
        createdAt: doc['createdAt']?.toDate() ?? DateTime.now(),
        paymentMethod: doc['paymentMethod'] ?? '',
      );
    }).toList();
  }

  // Update budget with detailed income and expense data
  Future<void> updateBudget(int year, int month) async {
    // String budgetId = '${userId}_${year}_${month.toString().padLeft(2, '0')}';
    String budgetId = '${year}_${month.toString().padLeft(2, '0')}';

    List<IncomeModel> incomes = await getIncomes(year, month);
    List<ExpenseModel> expenses = await getExpenses(year, month);

    double totalIncome = incomes.fold(0, (sum, item) => sum + int.parse(item.amount.toString()));
    double totalExpenses = expenses.fold(0, (sum, item) => sum + int.parse(item.amount.toString()));
    double balance = totalIncome - totalExpenses;

    // Start a batch write for efficiency
    WriteBatch batch = _firestore.batch();

    // Set main budget document
    DocumentReference budgetRef = _firestore.collection('budgets').doc(budgetId);
    batch.set(budgetRef, {
      // 'userId': userId,
      'year': year,
      'month': month,
      'totalIncome': totalIncome,
      'totalExpenses': totalExpenses,
      'balance': balance,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // Add incomes to subcollection
    for (var income in incomes) {
      batch.set(
        budgetRef.collection('incomes').doc(income.id),
        income,
      );
    }

    // Add expenses to subcollection
    for (var expense in expenses) {
      batch.set(
        budgetRef.collection('expenses').doc(expense.id),
        expense,
      );
    }

    // Commit the batch
    await batch.commit();
  }

  // Fetch budget details
  Future<Map<String, dynamic>?> getBudgetDetails(int year, int month) async {
    // String budgetId = '${userId}_$year_${month.toString().padLeft(2, '0')}';
    String budgetId = '${year}_${month.toString().padLeft(2, '0')}';

    DocumentSnapshot budgetDoc = await _firestore.collection('budgets').doc(budgetId).get();

    if (!budgetDoc.exists) return null;

    QuerySnapshot incomeDocs = await budgetDoc.reference.collection('incomes').get();
    QuerySnapshot expenseDocs = await budgetDoc.reference.collection('expenses').get();

    return {
      'totalIncome': budgetDoc['totalIncome'],
      'totalExpenses': budgetDoc['totalExpenses'],
      'balance': budgetDoc['balance'],
      'incomes': incomeDocs.docs.map((doc) => doc.data()).toList(),
      'expenses': expenseDocs.docs.map((doc) => doc.data()).toList(),
    };
  }
}