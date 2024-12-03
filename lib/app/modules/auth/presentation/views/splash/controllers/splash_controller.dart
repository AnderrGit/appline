import 'dart:developer';
import 'package:appline/app/core/config/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    ever(isLoading, (_) => navToHome());
    loadSplash();
    super.onInit();
    log('SplashController: onInit');
  }

  Future<void> loadSplash() async {
    await Future<void>.delayed(
      const Duration(seconds: 3),
      () {
        isLoading(false);
      },
    );
  }

  void navToHome() {
    Get.offAllNamed<void>(Routes.login);
  }
}
