import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.height,
    this.width,
    this.fontStyle,
    this.isEnabled = true,
  });

  final VoidCallback? onPressed; // Callback para manejar acciones del botón
  final String text; // Texto del botón
  final Color? color; // Color de fondo
  final Color? textColor; // Color del texto
  final double? borderRadius; // Bordes redondeados
  final double? height; // Altura del botón
  final double? width; // Ancho del botón
  final TextStyle? fontStyle; // Estilo del texto
  final bool isEnabled; // Habilitar o deshabilitar el botón

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        minimumSize: Size(
          width ?? double.infinity,
          height ?? AppDimensions.buttonHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppDimensions.borderRadius),
        ),
      ),
      child: Text(text, style: fontStyle ?? AppTextStyles.buttonTextStyle),
    );
  }
}
