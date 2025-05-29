import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/controller/income_controller.dart';
import '../../../common/widget/app_title_widget.dart';
import '../../../core/app_color.dart';
import '../../../core/dimensions.dart';
import '../../home/view/home_screen.dart';

class IncomeViewScreen extends StatefulWidget {
  IncomeViewScreen({super.key});

  @override
  State<IncomeViewScreen> createState() => _IncomeViewScreenState();
}

class _IncomeViewScreenState extends State<IncomeViewScreen> {
  final incomeController = Get.put(IncomeController());

  @override
  void initState() {
    incomeController.getIncomeRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(
          Dimensions.paddingSizeDefault(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            AppTitleWidget(text: 'Recent Transactions'),
            const SizedBox(height: 16),
            incomeController.obx(
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
                      incomeController.deleteIncomeRecord(id: state?[index].id ?? "");
                      await incomeController.getIncomeRecord();
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
    );
  }
}
