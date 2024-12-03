import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message, Color color) {
  Get.snackbar(
    title,
    message,
    backgroundColor: color,
    colorText: AppColors.whiteColor,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(AppDimensions.verticalSpacing),
  );
}
