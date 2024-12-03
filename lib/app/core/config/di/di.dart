import 'package:appline/app/core/config/di/dependencies/data_sources_di.dart';
import 'package:appline/app/core/config/di/dependencies/repositories_di.dart';
import 'package:appline/app/core/config/di/dependencies/use_cases_di.dart';
import 'package:flutter/material.dart';


class DependencyInjection {
  static void init() {
    WidgetsFlutterBinding.ensureInitialized();
    DataSourceDI.init();
    RepositoriesDI.init();
    UseCaseDI.init();
  }
}
