import 'package:flutter/material.dart';

import '../../core/app_color.dart';

extension CustomConstantWidget on Widget {
  static BoxDecoration shadowBoxDecorationWidget({
    double? radius,
    Color? color,
    Color? shadowColor,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 10),
      color: color ?? AppColors.backgroundGrey,
      border: Border.all(color: AppColors.lightGreyColor, width: 0.2),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? const Color(0xFFE8E8E8),
          blurRadius: 1,
          offset:const Offset(0,2),
        ),
      ],
    );
  }
}

extension DividerExtension on Widget {
  static Widget dividerWidget({double? height = 16}) {
    return Column(
      children: [
        Divider(
          thickness: 0.5,
          color: AppColors.primary.withOpacity(0.2),
        ),
         SizedBox(
          height: height,
        ),
      ],
    );
  }
}
