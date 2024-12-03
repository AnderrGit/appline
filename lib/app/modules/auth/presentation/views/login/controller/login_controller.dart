import 'package:appline/app/core/config/routes/routes.dart';
import 'package:appline/app/modules/auth/presentation/views/login/controller/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginForm = createLoginForm();

  void login() {
    if (loginForm.valid) {
      Get.toNamed(Routes.home);
    } else {
      debugPrint('Login failed');
    }
  }

  void register() {
    debugPrint('Forgot password');
    Get.toNamed(Routes.register);
  }
}
