// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

ExpenseModel expenseModelFromJson(String str) => ExpenseModel.fromJson(json.decode(str));

String expenseModelToJson(ExpenseModel data) => json.encode(data.toJson());

class ExpenseModel {

  String? id;
  String? amount;
  String? type;
  String? category;
  String? note;
  String? date;
  String? createdAt;
  String? svgPath;
  String? svgColor;
  String? paymentMethod;

  ExpenseModel({
    this.id,
    this.amount,
    this.type,
    this.category,
    this.note,
    this.date,
    this.createdAt,
    this.svgPath,
    this.svgColor,
    this.paymentMethod,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    amount: json["amount"],
    type: json["type"],
    category: json["category"],
    note: json["note"],
    date: json["date"],
    createdAt: json["createdAt"],
    svgPath: json["svgPath"],
    svgColor: json["svgColor"],
    paymentMethod: json["paymentMethod"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "type": type,
    "category": category,
    "note": note,
    "date": date,
    "createdAt": createdAt,
    "svgPath": svgPath,
    "svgColor": svgColor,
    "paymentMethod": paymentMethod,
  };
}
