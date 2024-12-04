import 'package:get/get.dart';
import 'package:appline/app/modules/home/domain/models/order_model.dart';
import 'package:appline/app/modules/home/presentation/controllers/orders_controller.dart';
import 'package:appline/app/modules/home/services/show_confirmation_dialog.dart';
import 'package:appline/app/modules/home/services/show_status_snackbar.dart';
import 'package:appline/app/core/design/constants.dart';

class OrderDetailsController extends GetxController {
  final Order order;

  OrderDetailsController({required this.order});

  final OrdersController ordersController = Get.find();

  Future<void> onAcceptOrder() async {
    final confirm =
        await showConfirmationDialog(Get.context!, order, 'aceptar');
    if (confirm == true) {
      await ordersController.acceptOrder(order);
      Get.back(); // Regresa a la pantalla anterior
      showSnackbar(
        'Orden Aceptada',
        'Has aceptado la orden: ${order.descripcionItem}',
        AppColors.primaryColor,
      );
    }
  }

  Future<void> onRejectOrder() async {
    final confirm =
        await showConfirmationDialog(Get.context!, order, 'rechazar');
    if (confirm == true) {
      await ordersController.declineOrder(order);
      Get.back(); // Regresa a la pantalla anterior
      showSnackbar(
        'Orden Rechazada',
        'Has rechazado la orden: ${order.descripcionItem}',
        AppColors.redColor,
      );
    }
  }
}
