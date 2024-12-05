import 'package:appline/app/modules/home/domain/repositories/orders_repository.dart';
import 'package:appline/app/modules/home/presentation/controllers/orders_controller.dart';
import 'package:appline/app/modules/home/presentation/views/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(Get.find<OrdersRepository>()),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
