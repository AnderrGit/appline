import 'package:appline/app/core/widgets/custom_button.dart';
import 'package:appline/app/core/widgets/vertical_sizedbox_spacing.dart';
import 'package:appline/app/modules/home/presentation/views/order_details/controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/modules/home/domain/entities/order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final OrderDetailsController controller =
        Get.put(OrderDetailsController(order: order));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: Get.back,
        ),
        title: Text(
          'Detalles de la Orden',
          style: AppTextStyles.appBarTextStyle,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailSection('Código del Ítem', order.itemCode),
            _buildDetailSection('Descripción del Ítem', order.descripcionItem),
            _buildDetailSection('Nombre del Socio', order.nombreSocio),
            _buildDetailSection(
                'Precio', '\$${order.precio.toStringAsFixed(2)}'),
            _buildDetailSection('Creado por', order.usuario),
            const Spacer(),
            _buildActionButtons(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.verticalSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.headingTextStyle,
          ),
          const SizedBox(height: 5),
          Text(
            content,
            style: AppTextStyles.primaryTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(OrderDetailsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          onPressed: () async {
            await controller.onAcceptOrder();
          },
          text: 'Aceptar',
          color: AppColors.primaryColor,
        ),
        const VerticalSizedboxSpacing(),
        CustomButton(
          onPressed: () async {
            await controller.onRejectOrder();
          },
          text: 'Rechazar',
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
