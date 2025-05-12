import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../core/api_config.dart';
import '../../core/app_color.dart';
import '../../core/app_storage.dart';
import '../../core/dimensions.dart';
import '../../di.dart';
import 'custom_buttons_widget.dart';

class DialogFailWidget extends StatelessWidget {
  const DialogFailWidget({
    super.key,
    this.title = 'បរាជ័យ',
    this.content = 'មានកំហុសកើតឡើងក្នុងការបញ្ជាក់ទិន្នន័យរបស់អ្នក។',
    required this.retry,
  });

  final String title;
  final String content;
  final VoidCallback retry;

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
              'assets/svg/error_animation.json',
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
                    color: AppColors.redColor,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onLongPress: () {
                final storage = getIt<AppStorage>();
                final url = storage.read(key: ConstantPreferenceKey.url);
                final param = storage.read(key: ConstantPreferenceKey.params);
                final payload = storage.read(key: ConstantPreferenceKey.payload);
                Clipboard.setData(
                  ClipboardData(
                    text: 'URL: \n\nPath:$url  \n\nParam: $param \n\nPayload: $payload',
                  ),
                ).then(
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Copied to clipboard'),
                    ),
                  ),
                );
              },
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor,
                    ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppButton.roundedFilledButton(
              context,
              onTap: retry,
              width: MediaQuery.sizeOf(context).width * 0.6,
              color: AppColors.redColor,
              backgroundColor: AppColors.redColor,
              textColor: AppColors.whiteColor,
              text: 'សាកល្បងម្ដងទៀត',
            )
          ],
        ),
      ),
    );
  }
}
