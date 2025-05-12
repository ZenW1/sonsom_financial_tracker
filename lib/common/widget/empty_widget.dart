import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/app_style.dart';

class EmptyWidget extends StatelessWidget {
   EmptyWidget({super.key, this.message = 'មិនមានទិន្នន័យដែលបានរកឃើញទេ។'});

   final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.2,),
        Center(
          child: Lottie.asset('assets/svg/empty.json',width: 200,height: 200),
        ),
        SizedBox(height: 16,),
        Text(message, style: headLine3),
      ],
    );
  }
}
