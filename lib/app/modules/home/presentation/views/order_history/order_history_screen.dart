import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/modules/home/domain/entities/order_model.dart';
import 'package:appline/app/modules/home/presentation/views/home/widgets/order_tile.dart';
import 'package:appline/app/modules/home/presentation/views/order_history/controller/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends GetView<OrderHistoryController> {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial de Órdenes',
          style: AppTextStyles.appBarTextStyle,
        ),
        backgroundColor: AppColors.primaryColor,
        bottom: TabBar(
          controller: controller.tabController,
          padding: const EdgeInsets.all(0),
          tabs: [
            Tab(
              child: Text('Aprobadas',
                  style: AppTextStyles.labelTextStyle
                      .copyWith(color: AppColors.whiteColor)),
            ),
            Tab(
              child: Text('Rechazadas',
                  style: AppTextStyles.labelTextStyle
                      .copyWith(color: AppColors.whiteColor)),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
          );
        }

        return TabBarView(
          controller: controller.tabController,
          children: [
            _buildOrderList(
              controller.approvedOrders,
              'No hay órdenes aprobadas',
            ),
            _buildOrderList(
              controller.rejectedOrders,
              'No hay órdenes rechazadas',
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.refreshHistory,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.refresh, color: AppColors.whiteColor),
      ),
    );
  }

  Widget _buildOrderList(List<Order> orders, String emptyMessage) {
    if (orders.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: AppTextStyles.secondaryTextStyle,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimensions.verticalSpacing),
      padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderTile(
          order: order,
          onTap: () {
            Get.toNamed('/order-details', arguments: order);
          },
          onAccept: () {},
          onReject: () {},
        );
      },
    );
  }
}
