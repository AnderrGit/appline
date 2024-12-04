import 'package:appline/app/modules/home/presentation/controllers/orders_controller.dart';
import 'package:appline/app/modules/home/presentation/views/home/widgets/order_tile.dart';
import 'package:appline/app/modules/home/services/show_status_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appline/app/core/design/constants.dart';

class HomeScreen extends GetView<OrdersController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Órdenes Disponibles',
          style: AppTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(() {
        if (controller.availableOrders.isEmpty) {
          return Center(
            child: Text(
              'No hay órdenes disponibles',
              style: AppTextStyles.secondaryTextStyle,
            ),
          );
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
          itemCount: controller.availableOrders.length,
          itemBuilder: (context, index) {
            final order = controller.availableOrders[index];
            return OrderTile(
              order: order,
              onAccept: () async {
                await controller.acceptOrder(order);
                showSnackbar(
                  'Orden Aceptada',
                  'Has aceptado la orden: ${order.descripcionItem}',
                  AppColors.primaryColor,
                );
              },
              onReject: () async {
                await controller.declineOrder(order);
                showSnackbar(
                  'Orden Rechazada',
                  'Has rechazado la orden: ${order.descripcionItem}',
                  AppColors.redColor,
                );
              },
            );
          },
        );
      }),
    );
  }
}
