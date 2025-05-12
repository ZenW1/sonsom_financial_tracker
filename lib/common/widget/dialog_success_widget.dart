import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/app_color.dart';
import '../../core/dimensions.dart';
import 'custom_buttons_widget.dart';

class DialogSuccessWidget extends StatelessWidget {
  const DialogSuccessWidget({
    super.key,
    this.title = 'ជោគជ័យ',
    this.content = 'ការបញ្ជាក់ទិន្នន័យរបស់អ្នកបានជោគជ័យ។',
    required this.onTap,
  });

  final String title;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        margin: const EdgeInsets.all(16),
        height: MediaQuery.sizeOf(context).height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.radiusLarge(),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/svg/success_animation.json',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              repeat: false,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.greenColor,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.secondaryColor,
                  ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton.roundedFilledButton(
              context,
              onTap: onTap,
              width: MediaQuery.sizeOf(context).width * 0.6,
              color: AppColors.greenColor,
              backgroundColor: AppColors.greenColor,
              textColor: AppColors.whiteColor,
              text: 'យល់ព្រម',
            )
          ],
        ),
      ),
    );
  }
}
