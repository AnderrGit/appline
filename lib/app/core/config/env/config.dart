import 'package:appline/app/core/utils/types/base_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config extends BaseConfig {
  @override
  String get environment => dotenv.env['ENVIRONMENT'] ?? '';

  @override
  bool get bannerVisibility => dotenv.env['BANNER_VISIBILITY'] == 'true';
}
