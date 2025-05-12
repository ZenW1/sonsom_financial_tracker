import 'package:flutter/material.dart';
import 'package:sonsom_financial_tracker/common/widget/app_title_widget.dart';
import 'package:sonsom_financial_tracker/common/widget/custom_text_filed.dart';
import 'package:sonsom_financial_tracker/core/app_color.dart';
import 'package:sonsom_financial_tracker/core/dimensions.dart';

class AddBudgetsScreen extends StatefulWidget {
  const AddBudgetsScreen({super.key});

  @override
  State<AddBudgetsScreen> createState() => _AddBudgetsScreenState();
}

class _AddBudgetsScreenState extends State<AddBudgetsScreen> {
  final TextEditingController controller = TextEditingController();

  late bool selectedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Budget"),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault()),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
              cursorWidth: 2,
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
                hintText: controller.text.isNotEmpty ? "" : "Amount",
                prefixText: controller.text.isNotEmpty ? "Amount" : "",
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
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppDivider(),
            SizedBox(
              height: Dimensions.paddingSizeDefault(),
            ),
            AppRowSelectionContentWidget(
              icon: Icons.wallet,
              name: "Budget Name",
              onTap: () {},
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall(),
            ),
            AppRowSelectionContentWidget(
              icon: Icons.category_outlined,
              name: "Select Category",
              onTap: () {
                // showModalBottomSheet(context: context, builder: (context){
                //
                // });
              },
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall(),
            ),
            AppRowSelectionContentWidget(
              icon: Icons.date_range_outlined,
              name: "Period",
              onTap: () {},
            ),
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
              name: "755% of budget exceeded",
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
