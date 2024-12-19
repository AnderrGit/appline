import 'package:appline/app/app.dart';
import 'package:appline/app/core/config/di/di.dart';
import 'package:appline/app/core/config/env/environments.dart';
import 'package:appline/app/core/config/firebase/firebase_config.dart';
import 'package:appline/app/core/config/firebase/messaging_service.dart';
import 'package:appline/app/core/utils/types/env_type.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Environment().initConfig(env: EnvType.dev);
  await FirebaseConfig.initialize();
  await MessagingService.initialize();
  DependencyInjection.init();
  runApp(const App());
}
