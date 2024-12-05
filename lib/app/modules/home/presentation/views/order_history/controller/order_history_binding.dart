import 'package:appline/app/modules/home/domain/repositories/orders_repository.dart';
import 'package:get/get.dart';
import 'order_history_controller.dart';

class OrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryController>(
        () => OrderHistoryController(Get.find<OrdersRepository>()));
  }
}
