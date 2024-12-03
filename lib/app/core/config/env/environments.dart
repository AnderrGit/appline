import 'package:appline/app/core/config/env/config.dart';
import 'package:appline/app/core/design/tokens/assets.gen.dart';
import 'package:appline/app/core/utils/types/base_config.dart';
import 'package:appline/app/core/utils/types/env_type.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  factory Environment() => _instance;

  Environment._internal();
  static final Environment _instance = Environment._internal();

  static late BaseConfig config;

  Future<void> initConfig({required EnvType env}) async {
    config = await _getConfig(env);
  }

  Future<BaseConfig> _getConfig(EnvType environment) async {
    switch (environment) {
      case EnvType.dev:
        await dotenv.load(fileName: AssetsToken.envs.aEnvDev);
        return Config();
      case EnvType.qa:
        await dotenv.load(fileName: AssetsToken.envs.aEnvQa);
        return Config();
      case EnvType.stg:
        await dotenv.load(fileName: AssetsToken.envs.aEnvStg);
        return Config();
    }
  }
}
