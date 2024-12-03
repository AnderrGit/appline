import 'package:appline/app/core/config/env/environments.dart';
import 'package:appline/app/core/config/routes/pages.dart';
import 'package:appline/app/core/config/routes/routes.dart';
import 'package:appline/app/core/widgets/wrap_banner.dart';
import 'package:appline/app/modules/auth/presentation/views/splash/controllers/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapBanner(
      label: Environment.config.environment,
      visible: Environment.config.bannerVisibility,
      child: GetMaterialApp(
        title: 'Amalia App',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        getPages: Pages.pagesList,
        initialRoute: Routes.splash,
        initialBinding: SplashBinding(),
      ),
    );
  }
}
