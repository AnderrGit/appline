import 'package:appline/app/modules/home/domain/models/order_model.dart';
import 'package:appline/app/modules/home/services/show_confirmation_dialog.dart';
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
    await confirmOrderAction(order, 'aceptar').then((confirmed) {
      if (confirmed != null && confirmed) {
        isLoading(true); // Marca como cargando
        availableOrders.remove(order);
        isLoading(false); // Marca como completado
      }
    });
  }

  Future<void> declineOrder(Order order) async {
    await confirmOrderAction(order, 'rechazar').then((confirmed) {
      if (confirmed != null && confirmed) {
        isLoading(true); // Marca como cargando
        availableOrders.remove(order);
        isLoading(false); // Marca como completado
      }
    });
  }

  Future<bool?> confirmOrderAction(Order order, String action) async {
    // Implementa la lógica para confirmar la acción de una orden
    return await showConfirmationDialog(Get.context!, order, action);
  }

  // Ver detalles de una orden
  void viewOrderDetails(Order order) {
    // Implementa la lógica para ver los detalles de una orden
  }
}
