import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    required this.text,
    super.key,
    this.fontColor,
    this.fontWeight,
    this.isRow = false,
    this.widget,
  });

  final String text;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final bool? isRow;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: fontColor ?? AppColors.blackColor,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontSize: 16,
              ),
        ),
        if (isRow == true) widget ?? Container() else Container(),
      ],
    );
  }
}
