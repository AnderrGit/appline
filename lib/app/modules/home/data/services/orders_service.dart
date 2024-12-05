import 'package:appline/app/core/config/env/environments.dart';
import 'package:appline/app/core/services/base_api_service.dart';
import 'package:appline/app/core/config/client/api_client.dart';
import 'package:appline/app/modules/home/data/models/order_model.dart';

class OrdersService extends BaseApiService {
  OrdersService(ApiClient super.apiClient);

  Future<List<OrderModel>> fetchOrders() async {
    return await get<List<OrderModel>>(
      '${Environment.config.baseUrl}/autorizaciones/nuevas',
      fromJson: (data) {
        final List<dynamic> list = data as List;
        return list.map((json) => OrderModel.fromJson(json)).toList();
      },
    );
  }

  Future<List<OrderModel>> fetchApprovedOrders() async {
    return await get<List<OrderModel>>(
      '${Environment.config.baseUrl}/autorizaciones/aprobadas',
      fromJson: (data) {
        final List<dynamic> list = data as List;
        return list.map((json) => OrderModel.fromJson(json)).toList();
      },
    );
  }

  Future<List<OrderModel>> fetchRejectedOrders() async {
    return await get<List<OrderModel>>(
      '${Environment.config.baseUrl}/autorizaciones/rechazadas',
      fromJson: (data) {
        final List<dynamic> list = data as List;
        return list.map((json) => OrderModel.fromJson(json)).toList();
      },
    );
  }
}
