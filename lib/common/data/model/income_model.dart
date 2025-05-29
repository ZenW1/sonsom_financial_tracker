
class IncomeModel {
  final String? id;
  final String? amount;
  final String? category;
  final String? note;
  final String? account;
  final String? svgPath;
  final String? svgColor;
  final String? date;
  final String? type;
  final DateTime? createdAt;

  IncomeModel({
     this.id,
    required this.amount,
    required this.category,
    required this.note,
    required this.account,
    required this.svgPath,
     required this.svgColor,
    required this.type,
    required this.date,
    required this.createdAt,
  });

  factory IncomeModel.fromMap(Map<String, dynamic> map, String docId) {
    return IncomeModel(
      id: docId,
      amount: map['amount'].toDouble(),
      category: map['category'],
      note: map['note'],
      svgPath: map['svgPath'],
      svgColor: map['svgColor'],
      account: map['account'],
      date: map['date'],
      type: map['type'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'category': category,
      'note': note,
      'account': account,
      'date': date,
      'type': type,
      'svgPath': svgPath,
      'svgColor': svgColor,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
