import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../core/dimensions.dart';
import 'custom_buttons_widget.dart';

extension DialogExtension on BuildContext {
  BuildContext get context => this;

  static dialogQuestion(BuildContext context,
      {required String title, required String content, required VoidCallback onYes, required VoidCallback onNo}) {
    {
      return showCupertinoDialog(
          context: context,
          builder: (context) {
            return Dialog(
              elevation: 0,
              insetPadding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                height: MediaQuery.sizeOf(context).height * 0.19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radiusLarge(),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: AppColors.greyColor,
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton.roundedSidedButton(
                            context,
                            onTap: onNo,
                            color: AppColors.redColor,
                            textColor: AppColors.redColor,
                            text: 'បោះបង់',
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: AppButton.roundedFilledButton(
                            context,
                            onTap: onYes,
                            backgroundColor: AppColors.redColor,
                            text: 'ចេញ',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      );
    }
  }

  static dialogMain(BuildContext context,
      {required String title, required String content, required VoidCallback onYes, required VoidCallback onNo}) {
    {
      return showCupertinoDialog(
          context: context,
          builder: (context) {
            return Dialog(
              elevation: 0,
              insetPadding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radiusLarge(),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: AppColors.greyColor,
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      content,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton.roundedSidedButton(
                            context,
                            onTap: onNo,
                            color: AppColors.primary,
                            textColor: AppColors.primary,
                            text: 'មិនយល់ព្រម',
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: AppButton.roundedFilledButton(
                            context,
                            onTap: onYes,
                            backgroundColor: AppColors.primary,
                            text: 'យល់ព្រម',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      );
    }
  }

}