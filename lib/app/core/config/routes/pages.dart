import 'package:appline/app/core/config/routes/routes.dart';
import 'package:appline/app/modules/auth/presentation/views/login/controller/login_binding.dart';
import 'package:appline/app/modules/auth/presentation/views/login/login_screen.dart';
import 'package:appline/app/modules/auth/presentation/views/splash/controllers/splash_binding.dart';
import 'package:appline/app/modules/auth/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final List<GetPage<void>> pagesList = <GetPage<void>>[
    GetPage<void>(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    // GetPage<void>(
    //   name: Routes.home,
    //   page: () => const HomeScreen(),
    //   binding: HomeBinding(),
    //   transition: Transition.zoom,
    // ),
    GetPage<void>(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.zoom,
    ),
    // GetPage<void>(
    //   name: Routes.register,
    //   page: () => const RegisterScreen(),
    //   binding: RegisterBinding(),
    //   transition: Transition.zoom,
    // ),
  ];
}
