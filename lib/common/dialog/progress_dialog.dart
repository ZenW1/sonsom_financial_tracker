import 'package:flutter/material.dart';

import '../widget/spinkit_indicator.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({
    super.key,
    required this.title,
    required this.isProgressed,
    this.onPressed,
  });

  final String title;
  final bool isProgressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text("Please wait"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          isProgressed
              ?  const SpinKitIndicator(type: SpinKitType.circle,)
              : const SizedBox(),
          const SizedBox(height: 15),
          Text(title),
          SizedBox(
            width: double.infinity,
            child: isProgressed
                ? const SizedBox()
                : ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("ជោគជ័យ"),
                  ),
          )
        ],
      ),
    );
  }
}
