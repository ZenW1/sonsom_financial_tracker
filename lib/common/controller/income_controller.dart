import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsom_financial_tracker/common/controller/base_controller.dart';
import 'package:sonsom_financial_tracker/common/data/model/category_content_model.dart';
import 'package:sonsom_financial_tracker/common/data/model/expense_model.dart';
import 'package:sonsom_financial_tracker/common/data/model/income_model.dart';
import 'package:sonsom_financial_tracker/common/data/repository/expense_repository.dart';
import 'package:sonsom_financial_tracker/common/data/repository/income_repository.dart';
import 'package:sonsom_financial_tracker/common/widget/category_content_widget.dart';
import 'package:sonsom_financial_tracker/common/widget/show_snack_bar_widget.dart';

class IncomeController extends GetxController with StateMixin<List<IncomeModel>>, BaseController {
  final IncomeRepository _incomeRepository = IncomeRepository();

  RxString budgetName = ''.obs;

  Rxn<ExpenseModel>? expenseData;
  RxString title = "Select Category".obs;
  TextEditingController amountController = TextEditingController();

  CategoryContentModel? categoryContentData;

  Rx<DateTime>? selectedPeriod = DateTime.now().obs;
  TextEditingController budgetController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    budgetController.addListener(() {
      budgetName.value = budgetController.text;
    });
  }

  Future<void> addIncomeRecord({required IncomeModel data}) async {
    change(null, status: RxStatus.loading());
    bool result = await _incomeRepository.addIncomeRecord(data: data);

    if (result) {
      apiStatus.value = ApiState.success;
      change(null, status: RxStatus.success());
    } else {
      RxStatus.error("Failed to add expense");
    }
  }

  Future<void> deleteIncomeRecord({required String id}) async {
    change(null,status: RxStatus.loading());
    try {
      bool result = await _incomeRepository.deleteIncomeRecord(id: id);

      if (result) {
        apiStatus.value = ApiState.success;
        change(null, status: RxStatus.success());
        ShowSnackBarWidget.showSuccessSnackbarWidget(Get.context!, message: 'Delete Success');
      } else {
        apiStatus.value = ApiState.failure;

        RxStatus.error("Failed to add expense");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<void> getIncomeRecord() async {
    change(null, status: RxStatus.loading());

    try {
      final data = await _incomeRepository.getIncomeRecord();

      if (data.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  void onSelectedCategory({CategoryContentModel? data}) {
    categoryContentData = data;
    title.value = categoryContentData?.title ?? "";
    Get.back();
    update();
  }
}
