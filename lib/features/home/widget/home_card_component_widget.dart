import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

class HomeCardComponentWidget extends StatelessWidget {
  const HomeCardComponentWidget(
      {super.key, required this.title, required this.value, required this.textColor, required this.svgPath});

  final String title;
  final String value;
  final Color textColor;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // random user photo
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: Image.network(
                    svgPath,
                    fit: BoxFit.cover,
                    width: 200,
                  ).image,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: textColor,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$value',
                      textScaler: TextScaler.linear(1.2),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
