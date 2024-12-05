import 'package:appline/app/modules/home/domain/entities/order_model.dart';
import 'package:appline/app/modules/home/domain/repositories/orders_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final OrdersRepository _ordersRepository;
  late TabController tabController;
  var approvedOrders = <Order>[].obs;
  var rejectedOrders = <Order>[].obs;
  var isLoading = false.obs;

  OrderHistoryController(this._ordersRepository);

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    fetchHistoryOrders();
  }

  // Cargar el historial completo (aprobadas y rechazadas)
  Future<void> fetchHistoryOrders() async {
    isLoading.value = true;
    await Future.wait([
      fetchApprovedOrders(),
      fetchRejectedOrders(),
    ]);
    isLoading.value = false;
  }

  // Cargar órdenes aprobadas
  Future<void> fetchApprovedOrders() async {
    try {
      final orders = await _ordersRepository.fetchApprovedOrders();
      approvedOrders.value = orders;
    } catch (e) {
      debugPrint('Error al obtener las órdenes aprobadas: $e');
    }
  }

  // Cargar órdenes rechazadas
  Future<void> fetchRejectedOrders() async {
    try {
      final orders = await _ordersRepository.fetchRejectedOrders();
      rejectedOrders.value = orders;
    } catch (e) {
      debugPrint('Error al obtener las órdenes rechazadas: $e');
    }
  }

  // Refrescar historial
  Future<void> refreshHistory() async {
    await fetchHistoryOrders();
  }
}
