import 'package:appline/app/modules/home/data/services/orders_service.dart';
import 'package:appline/app/modules/home/domain/entities/order_model.dart';
import 'package:appline/app/modules/home/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersService _ordersService;

  OrdersRepositoryImpl(this._ordersService);

  @override
  Future<List<Order>> fetchOrders() async {
    final orderModels = await _ordersService.fetchOrders();
    return orderModels.map((orderModel) => orderModel.toDomain()).toList();
  }

  @override
  Future<List<Order>> fetchApprovedOrders() async {
    final orderModels = await _ordersService.fetchApprovedOrders();
    return orderModels.map((orderModel) => orderModel.toDomain()).toList();
  }

  @override
  Future<List<Order>> fetchRejectedOrders() async {
    final orderModels = await _ordersService.fetchRejectedOrders();
    return orderModels.map((orderModel) => orderModel.toDomain()).toList();
  }
}
