import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Redirige al LoginScreen después de 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed('/login');
    });
  }
}
