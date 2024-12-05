import 'package:appline/app/core/config/client/api_client.dart';
import 'package:appline/app/modules/home/data/services/orders_service.dart';
import 'package:get/get.dart';

class ServicesDI {
  static void init() {
    // Register data sources
    final ApiClient client = ApiClient();
    Get.put<OrdersService>(OrdersService(client));
  }
}
