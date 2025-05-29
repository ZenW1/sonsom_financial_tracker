import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:sonsom_financial_tracker/common/service/category_service.dart';

import '../../../common/controller/expense_controller.dart';
import '../../../common/data/model/expense_model.dart';
import '../../../common/widget/app_title_widget.dart';
import '../../../common/widget/async_widget.dart';
import '../../../common/widget/category_content_widget.dart';
import '../../../core/app_color.dart';
import '../../../core/curreny_input_formatter.dart';
import '../../../core/dimensions.dart';
import '../../main/view/main_screen.dart';
import 'add_budget_name_screen.dart';
import 'add_income_screen.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late bool selectedValue = false;

  final controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
        actions: [
          TextButton(
            onPressed: () async {
              controller.addExpenseRecord(
                data: ExpenseModel(
                  amount: controller.amountController.text,
                  type: "expense",
                  category: controller.categoryContentData?.title ?? "",
                  note: controller.budgetName.value,
                  date: controller.selectedPeriod?.value.toString() ?? "",
                  svgPath: '${controller.categoryContentData?.svgPath}',
                  svgColor: controller.categoryContentData?.itemColor.value.toRadixString(16).toUpperCase(),
                  paymentMethod: "Cash",
                ),
              );

              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return Obx(
                    () {
                      return AsyncWidget(
                        onTapManual: () {
                          Get.offAll(() => const MainScreen(), transition: Transition.fadeIn);
                        },
                        apiState: controller.apiStatus.value,
                        progressStatusTitle: 'កំពុងចូលគណនី',
                        failureStatusTitle: controller.errorMessage.value,
                        successStatusTitle: "ចូលគណនីបានជោគជ័យ",
                        onSuccessPressed: () {
                          // print(' access token  ${getIt<AppStorage>().read(key: ConstantPreferenceKey.accessTokenKey)}');
                          Get.offAll(() => const MainScreen(), transition: Transition.fadeIn);
                        },
                        onRetryPressed: () => Get.back(),
                      );
                    },
                  );
                },
              );
            },
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault()),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Amount',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controller.amountController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.end,
                      // textDirection: TextDirection.rtl,
                      cursorWidth: 2,
                      inputFormatters: [
                        CurrencyInputFormatter(),
                      ],
                      cursorColor: AppColors.primary,
                      cursorOpacityAnimates: true,
                      validator: (value) {
                        if (value == null) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.titleLarge,
                        alignLabelWithHint: false,
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none, // Customize color
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none, // Customize color
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppDivider(),
            SizedBox(
              height: Dimensions.paddingSizeSmall(),
            ),
            Obx(() {
              return AppRowSelectionContentWidget(
                icon: Icons.date_range_outlined,
                name: controller.selectedPeriod?.value != null
                    ? DateFormat('yyyy-MM-dd').format(controller.selectedPeriod!.value)
                    : "Period",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                        ),
                        value: [
                          DateTime.now(),
                        ],
                        onValueChanged: (dates) {
                          controller.selectedPeriod?.value = dates.first;
                          Get.back();
                        },
                      );
                    },
                  );
                },
              );
            }),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            Obx(
              () {
                return AppRowSelectionContentWidget(
                  icon: Icons.category_outlined,
                  name: controller.title.value,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "Select Category",
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    textAlign: TextAlign.right,
                                    'Cancel',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              GetBuilder<ExpenseController>(
                                builder: (logic) {
                                  return GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                    ),
                                    itemCount: CategoryService().listCategory.length,
                                    itemBuilder: (context, index) {
                                      return CategoryContentWidget(
                                        title: CategoryService().listCategory[index].title,
                                        svgPath: CategoryService().listCategory[index].svgPath,
                                        itemColor: CategoryService().listCategory[index].itemColor,
                                        onTap: () {
                                          controller.onSelectedCategory(
                                            data: CategoryService().listCategory[index],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppRowSelectionContentWidget(
              icon: Icons.note_add_outlined,
              name: controller.budgetName.value,
              onTap: () {
                Get.to(
                  () => AddBudgetNameScreen(budgetNameController: controller),
                );
              },
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppRowSelectionContentWidget(
              icon: Icons.add_photo_alternate_outlined,
              name: 'Add Receipt Image',
              onTap: () {
                Get.to(
                  () => AddBudgetNameScreen(budgetNameController: controller),
                );
              },
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
          ],
        ),
      ),
    );
  }
}
