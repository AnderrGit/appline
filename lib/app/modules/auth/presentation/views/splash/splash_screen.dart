import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/core/widgets/vertical_sizedbox_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirige a Login después de 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed('/login');
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.apps,
              size: 120,
              color: AppColors.primaryColor,
            ),
            const VerticalSizedboxSpacing(),
            Text(
              'Appline',
              style: AppTextStyles.headingTextStyle.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const VerticalSizedboxSpacing(),
            Text(
              'Optimizing your digital experience',
              style: AppTextStyles.secondaryTextStyle,
            ),
            const VerticalSizedboxSpacing(),
            const CircularProgressIndicator(
              // Indicador de progreso
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
