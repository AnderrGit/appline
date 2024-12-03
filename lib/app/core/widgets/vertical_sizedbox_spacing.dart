import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';

class VerticalSizedboxSpacing extends StatelessWidget {
  const VerticalSizedboxSpacing(
      {super.key, this.height = AppDimensions.verticalSpacing});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
