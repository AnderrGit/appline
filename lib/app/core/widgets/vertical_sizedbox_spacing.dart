import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';

class VerticalSizedboxSpacing extends StatelessWidget {
  const VerticalSizedboxSpacing({
    super.key,
    this.height = AppDimensions.verticalSpacing,
    this.times = 1,
  });

  final double height;
  final int times;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * times,
    );
  }
}
