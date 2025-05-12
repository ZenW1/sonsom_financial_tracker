import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class RowInfoWidget extends StatelessWidget {
  const RowInfoWidget({super.key, required this.title, required this.value, this.textValueColor, this.textTitleColor});

  final String title;
  final String value;
  final Color? textValueColor;
  final Color? textTitleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: TextStyle(
              color: textTitleColor ?? AppColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Text(' : '),
        const SizedBox(width: 32),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55 - 40,
          child: Text(
            value,
            maxLines: 3,
            style: TextStyle(
              color: textValueColor ?? AppColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
