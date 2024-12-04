import 'package:appline/app/modules/home/domain/models/order_model.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  // Lista de órdenes disponibles
  var availableOrders = <Order>[
    Order(
      id: 1,
      itemCode: '123456',
      descripcionItem: 'Descripción del ítem',
      codigoSocio: '78910',
      nombreSocio: 'Nombre del socio',
      usuario: 'usuario123',
      fechaCreacion: DateTime.now(),
      estado: '0',
      precio: 150.75,
    ),
    // Agrega más órdenes aquí
  ].obs;

  // Lista de órdenes procesadas
  var orderHistory = <Order>[].obs;
  RxBool isLoading = false.obs;

  Future<void> acceptOrder(Order order) async {
    isLoading(true); // Marca como cargando
    availableOrders.remove(order);
    isLoading(false); // Marca como completado
  }

  Future<void> declineOrder(Order order) async {
    isLoading(true); // Marca como cargando
    availableOrders.remove(order);
    isLoading(false); // Marca como completado
  }

  // Ver detalles de una orden
  void viewOrderDetails(Order order) {
    // Implementa la lógica para ver los detalles de una orden
  }
}
