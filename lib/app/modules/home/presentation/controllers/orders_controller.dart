import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/modules/home/domain/entities/order_model.dart';
import 'package:appline/app/modules/home/domain/repositories/orders_repository.dart';
import 'package:appline/app/modules/home/presentation/views/order_details/order_details_screen.dart';
import 'package:appline/app/modules/home/services/show_status_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final OrdersRepository _ordersRepository;
  var availableOrders = <Order>[].obs;
  var isLoading = false.obs;

  OrdersController(this._ordersRepository);

  @override
  void onInit() {
    super.onInit();
    fetchAvailableOrders();
  }

  // Lista de órdenes disponibles
  Future<void> fetchAvailableOrders() async {
    isLoading.value = true;
    try {
      final orders = await _ordersRepository.fetchOrders();
      availableOrders.value = orders;
    } catch (e) {
      debugPrint('Error al obtener las órdenes: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> acceptOrder(Order order) async {
    isLoading(true); // Marca como cargando
    availableOrders.remove(order);
    isLoading(false); // Marca como completado
    showSnackbar(
      'Orden Aceptada',
      'Has aceptado la orden: ${order.descripcionItem}',
      AppColors.primaryColor,
    );
  }

  Future<void> declineOrder(Order order) async {
    isLoading(true); // Marca como cargando
    availableOrders.remove(order);
    isLoading(false); // Marca como completado
    showSnackbar(
      'Orden Rechazada',
      'Has rechazado la orden: ${order.descripcionItem}',
      AppColors.redColor,
    );
  }

  // Ver detalles de una orden
  void viewOrderDetails(Order order) {
    // Implementa la lógica para ver los detalles de una orden
    Get.to(() => OrderDetailsScreen(order: order),
        transition: Transition.cupertino);
  }
}
