import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsom_financial_tracker/common/controller/expense_controller.dart';
import 'package:sonsom_financial_tracker/core/dimensions.dart';

import '../../../common/widget/app_title_widget.dart';
import '../../../core/app_color.dart';
import '../../home/view/home_screen.dart';

class ExpenseViewScreen extends StatefulWidget {
  const ExpenseViewScreen({super.key});

  @override
  State<ExpenseViewScreen> createState() => _ExpenseViewScreenState();
}

class _ExpenseViewScreenState extends State<ExpenseViewScreen> {

  final controller = Get.put(ExpenseController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getExpenseData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(Dimensions.paddingSizeDefault()),
          child: Column(
            children: [
              AppTitleWidget(text: 'Recent Transactions'),
              const SizedBox(height: 16),
              controller.obx(
                  onLoading: Center(
                    child: CircularProgressIndicator(),
                  ),
                  onEmpty: Center(
                    child: Text('No data'),
                  ), (state) {
                return ListView.separated(
                  itemCount: state?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SlideToDeleteItem(
                      key: Key("$index"),
                      onDelete: () async {
                        controller.deleteExpenseRecord(id: state?[index].id ?? "");
                        await controller.getExpenseData();
                      },
                      child: AppTransactionContentWidget(
                        svgPath: state?[index].svgPath ?? "",
                        title: state?[index].note ?? "",
                        subTitle: state?[index].category ?? "",
                        value: state?[index].amount.toString() ?? "",
                        date: state?[index].date ?? "",
                        valueColor: AppColors.redColor,
                        svgColor: Color(int.parse('0xFF${state?[index].svgColor}')),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      height: Dimensions.paddingSizeDefault(),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
