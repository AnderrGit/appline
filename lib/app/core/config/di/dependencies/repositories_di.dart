import 'package:appline/app/modules/home/data/repositories/orders_repository_impl.dart';
import 'package:appline/app/modules/home/data/services/orders_service.dart';
import 'package:appline/app/modules/home/domain/repositories/orders_repository.dart';
import 'package:get/get.dart';

class RepositoriesDI {
  static void init() {
    // Register repositories
    Get.put<OrdersRepository>(OrdersRepositoryImpl(Get.find<OrdersService>()));
  }
}
