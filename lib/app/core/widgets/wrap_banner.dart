import 'dart:ui' as ui;
import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';

class WrapBanner extends StatelessWidget {
  const WrapBanner({
    super.key,
    required this.child,
    this.label = '',
    this.color,
    this.location = BannerLocation.topStart,
    this.visible = true,
  });

  final Widget? child;
  final String? label;
  final Color? color;
  final BannerLocation? location;
  final bool? visible;
  @override
  Widget build(BuildContext context) {
    if (visible != null && visible!) {
      return Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Banner(
          location: location ?? BannerLocation.topStart,
          message: label ?? '',
          color: color ?? (label == 'QA' ? Colors.blue : Colors.green),
          textStyle: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          child: child,
        ),
      );
    } else {
      return child ?? const SizedBox();
    }
  }
}
