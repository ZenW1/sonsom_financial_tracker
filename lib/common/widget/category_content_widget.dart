import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_color.dart';
import '../../core/dimensions.dart';

class CategoryContentWidget extends StatelessWidget {
  const CategoryContentWidget({super.key, required this.title, required this.svgPath, required this.itemColor, required this.onTap});

  final String title;
  final String svgPath;
  final Color itemColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return       InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGreyColor,
            radius: 30,
            child: SvgPicture.asset(
              svgPath,
              color: itemColor,
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSizeSmall(),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
