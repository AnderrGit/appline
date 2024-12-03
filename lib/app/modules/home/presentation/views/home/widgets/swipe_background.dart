import 'package:flutter/material.dart';
import 'package:appline/app/core/design/constants.dart';

class SwipeBackground extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Alignment alignment;

  const SwipeBackground({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (alignment == Alignment.centerLeft)
            Icon(icon, color: AppColors.whiteColor),
          if (alignment == Alignment.centerLeft) const SizedBox(width: 10),
          if (alignment == Alignment.centerLeft)
            Text(
              text,
              style: AppTextStyles.secondaryTextStyle
                  .copyWith(color: AppColors.whiteColor),
            ),
          if (alignment == Alignment.centerRight)
            Text(
              text,
              style: AppTextStyles.secondaryTextStyle
                  .copyWith(color: AppColors.whiteColor),
            ),
          if (alignment == Alignment.centerRight) const SizedBox(width: 10),
          if (alignment == Alignment.centerRight)
            Icon(icon, color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
