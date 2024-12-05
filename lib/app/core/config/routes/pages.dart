import 'package:appline/app/core/config/routes/routes.dart';
import 'package:appline/app/modules/auth/presentation/views/login/controller/login_binding.dart';
import 'package:appline/app/modules/auth/presentation/views/login/login_screen.dart';
import 'package:appline/app/modules/auth/presentation/views/splash/controllers/splash_binding.dart';
import 'package:appline/app/modules/auth/presentation/views/splash/splash_screen.dart';
import 'package:appline/app/modules/home/presentation/views/home/controller/home_binding.dart';
import 'package:appline/app/modules/home/presentation/views/home/home_screen.dart';
import 'package:appline/app/modules/home/presentation/views/order_history/controller/order_history_binding.dart';
import 'package:appline/app/modules/home/presentation/views/order_history/order_history_screen.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final List<GetPage<void>> pagesList = <GetPage<void>>[
    GetPage<void>(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<void>(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<void>(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    // Order History Page
    GetPage<void>(
      name: Routes.orderHistory,
      page: () => const OrderHistoryScreen(),
      binding: OrderHistoryBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
