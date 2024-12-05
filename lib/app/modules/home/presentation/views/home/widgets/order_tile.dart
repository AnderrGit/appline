import 'package:appline/app/modules/home/domain/entities/order_model.dart';
import 'package:appline/app/modules/home/services/show_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:appline/app/core/design/constants.dart';
import 'package:get/get.dart';
import 'swipe_background.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final VoidCallback onTap;

  const OrderTile({
    super.key,
    required this.order,
    required this.onAccept,
    required this.onReject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        border: Border.all(color: AppColors.borderColor, width: 1.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Dismissible(
              key: ValueKey(order.id),
              direction: DismissDirection.horizontal,
              background: const SwipeBackground(
                color: Colors.green,
                icon: Icons.check,
                text: 'Aceptar',
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground: const SwipeBackground(
                color: Colors.red,
                icon: Icons.close,
                text: 'Rechazar',
                alignment: Alignment.centerRight,
              ),
              confirmDismiss: (direction) async {
                return await showConfirmationDialog(
                  Get.context!,
                  order,
                  direction == DismissDirection.startToEnd
                      ? 'aceptar'
                      : 'rechazar',
                );
              },
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  onAccept();
                } else {
                  onReject();
                }
              },
              child: ListTile(
                title: Text(
                  'Ítem: ${order.itemCode}',
                  style: AppTextStyles.primaryTextStyle,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Socio: ${order.nombreSocio}',
                      style: AppTextStyles.secondaryTextStyle,
                    ),
                    Text(
                      'Precio: \$${order.precio.toStringAsFixed(2)}',
                      style: AppTextStyles.secondaryTextStyle,
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: AppColors.secondaryColor),
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
