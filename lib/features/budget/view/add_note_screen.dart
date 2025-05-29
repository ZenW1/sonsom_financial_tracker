import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsom_financial_tracker/common/controller/expense_controller.dart';
import 'package:sonsom_financial_tracker/common/controller/income_controller.dart';
import 'package:sonsom_financial_tracker/common/widget/app_title_widget.dart';
import 'package:sonsom_financial_tracker/common/widget/custom_text_filed.dart';
import 'package:sonsom_financial_tracker/core/app_color.dart';
import 'package:sonsom_financial_tracker/core/dimensions.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_expense_screen.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_income_screen.dart';


class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, required this.incomeController});

  final IncomeController incomeController;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.clear,
          ),
        ),
        title: Text("Budget Name"),
        actions: [
          TextButton(
            onPressed: () {
              _navigateAndSetBudgetName();
            },
            child: Text("Enter"),
          )
          ,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(
          Dimensions.paddingSizeDefault(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppTitleWidget(
              text: "Name",
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            CustomTextField(
              textInputType: TextInputType.text,
              controller:widget.incomeController.budgetController,
              hintText: "Example : foods/drinks",
            )
          ],
        ),
      ),
    );
  }

  void _navigateAndSetBudgetName() async {
    final result = await Get.to(() => AddIncomeScreen());
    if (result != null) {
      widget.incomeController.budgetName.value = result;
    }
    setState(() {
      // Update a local variable or controller value
    });
  }


}
