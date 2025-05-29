import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sonsom_financial_tracker/common/controller/expense_controller.dart';
import 'package:sonsom_financial_tracker/common/controller/income_controller.dart';
import 'package:sonsom_financial_tracker/common/data/model/expense_model.dart';
import 'package:sonsom_financial_tracker/common/data/model/income_model.dart';
import 'package:sonsom_financial_tracker/common/service/category_service.dart';
import 'package:sonsom_financial_tracker/common/widget/app_title_widget.dart';
import 'package:sonsom_financial_tracker/common/widget/category_content_widget.dart';
import 'package:sonsom_financial_tracker/core/app_color.dart';
import 'package:sonsom_financial_tracker/core/curreny_input_formatter.dart';
import 'package:sonsom_financial_tracker/core/dimensions.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_budget_name_screen.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_note_screen.dart';
import 'package:sonsom_financial_tracker/features/main/view/main_screen.dart';

import '../../../common/widget/async_widget.dart';

class AddIncomeScreen extends StatefulWidget {
  AddIncomeScreen({
    super.key,
  });

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  late bool selectedValue = false;
  final controller = Get.put(IncomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Income"),
        actions: [
          TextButton(
            onPressed: () async {
              controller.addIncomeRecord(
                data: IncomeModel(
                  amount: controller.amountController.text,
                  type: "income",
                  category: controller.categoryContentData?.title ?? "",
                  note: controller.budgetName.value,
                  date: controller.selectedPeriod?.value.toString() ?? "",
                  svgPath: '${controller.categoryContentData?.svgPath}',
                  svgColor: controller.categoryContentData?.itemColor.value.toRadixString(16).toUpperCase(),
                  account: "Cash",
                  createdAt: DateTime.now(),
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
              height: Dimensions.paddingSizeDefault(),
            ),
            AppRowSelectionContentWidget(
              icon: Icons.wallet,
              name: controller.budgetName.value,
              onTap: () {
                Get.to(
                  () => AddNoteScreen(incomeController: controller),
                );
              },
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall(),
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
              height: Dimensions.paddingSizeSmall(),
            ),
            Obx(() {
              return AppRowSelectionContentWidget(
                icon: Icons.date_range_outlined,
                name: controller.selectedPeriod?.value != null
                    ? DateFormat('yyyy-MM-dd').format(controller.selectedPeriod!.value!)
                    : "Period",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                        ),
                        value: [DateTime.now()],
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
            AppTitleWidget(
              text: "In-app Notification",
            ),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppSwitchStatusContentWidget(
              name: "Budget Overspent",
              icon: Icons.incomplete_circle_rounded,
              selectedValue: selectedValue,
              onChange: (value) {
                selectedValue = value;
                setState(() {});
              },
            ),
            AppSwitchStatusContentWidget(
              name: "75% of budget exceeded",
              icon: Icons.incomplete_circle_rounded,
              selectedValue: selectedValue,
              onChange: (value) {
                selectedValue = value;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

class AppRowSelectionContentWidget extends StatelessWidget {
  const AppRowSelectionContentWidget({super.key, required this.icon, required this.name, required this.onTap});

  final IconData icon;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: Dimensions.paddingSizeDefault(),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSwitchStatusContentWidget extends StatefulWidget {
  const AppSwitchStatusContentWidget(
      {super.key, required this.icon, required this.name, required this.selectedValue, this.onChange});

  final IconData icon;
  final String name;

  final bool selectedValue;
  final ValueChanged<bool>? onChange;

  @override
  State<AppSwitchStatusContentWidget> createState() => _AppSwitchStatusContentWidgetState();
}

class _AppSwitchStatusContentWidgetState extends State<AppSwitchStatusContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: Dimensions.paddingSizeDefault(),
                ),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Switch.adaptive(
              value: widget.selectedValue,
              onChanged: widget.onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Divider(
        height: 2,
        thickness: 1,
        color: AppColors.greyColor,
      ),
    );
  }
}
