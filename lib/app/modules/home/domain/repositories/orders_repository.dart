import 'package:appline/app/modules/home/domain/entities/order_model.dart';

abstract class OrdersRepository {
  Future<List<Order>> fetchOrders();
  Future<List<Order>> fetchApprovedOrders();
  Future<List<Order>> fetchRejectedOrders();
}
