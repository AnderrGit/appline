import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/modules/home/domain/models/order_model.dart';
import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(
    BuildContext context, Order order, String action) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Confirmar ${action == 'aceptar' ? 'aceptación' : 'rechazo'}',
          style: AppTextStyles.headingTextStyle,
        ),
        content: Text(
          '¿Estás seguro que deseas $action la orden: ${order.descripcionItem}?',
          style: AppTextStyles.secondaryTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: AppColors.greyColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              action == 'aceptar' ? 'Aceptar' : 'Rechazar',
              style: TextStyle(
                color: action == 'aceptar' ? Colors.green : Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}
