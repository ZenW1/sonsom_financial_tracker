import 'package:flutter/material.dart';


import '../controller/base_controller.dart';
import '../dialog/progress_dialog.dart';
import 'dialog_fail_widget.dart';
import 'dialog_success_widget.dart';

class AsyncWidget extends StatelessWidget {
  const AsyncWidget({
    super.key,
    required this.apiState,
    required this.progressStatusTitle,
    required this.failureStatusTitle,
    required this.successStatusTitle,
    required this.onRetryPressed,
    required this.onSuccessPressed,
    required this.onTapManual,
  });

  final ApiState apiState;
  final String progressStatusTitle;
  final String failureStatusTitle;
  final String successStatusTitle;
  final VoidCallback onRetryPressed;
  final VoidCallback onSuccessPressed;
  final VoidCallback onTapManual;

  @override
  Widget build(BuildContext context) {
    return switch (apiState) {
      ApiState.loading => ProgressDialog(
          title: progressStatusTitle,
          isProgressed: true,
        ),
      ApiState.failure => DialogFailWidget(
          retry: onRetryPressed,
          content: failureStatusTitle,
        ),
      ApiState.success => DialogSuccessWidget(
          onTap: onSuccessPressed,
        ),
      ApiState.manual => InkWell(
          onTap: onTapManual,
        ),
    };
  }
}
