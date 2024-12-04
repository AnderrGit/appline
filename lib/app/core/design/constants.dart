import 'package:flutter/material.dart';

// Colores
class AppColors {
  static const Color primaryColor =
      Color(0xFF1e3a5f); // Color del botón 'Registrar'
  static const Color secondaryColor =
      Color(0xFF1e3a5f); // Para bordes y textos secundarios
  static const Color tabColor = Color(0xFFCFD9E9); // Color de las tabs
  static const Color backgroundColor = Color(0xFFFFFFFF); // Fondo blanco
  static const Color textPrimaryColor = Color(0xFF333333); // Texto principal
  static const Color textSecondaryColor = Color(0xFF5D5D5D); // Texto secundario
  static const Color googleButtonColor =
      Color(0xFFF4F4F4); // Fondo botón Google
  static const Color dividerColor = Color(0xFFE0E0E0); // Línea divisora
  static const Color borderColor = Color(0xffa4a4a4); // Color de borde

  static const Color redColor = Color(0xFFD32F2F); // Color de error
  static const Color whiteColor = Color(0xFFFFFFFF); // Color blanco
  static const Color greyColor = Color(0xFFA4A4A4); // Color gris
  static const Color greenColor = Color(0xFF4CAF50); // Color verde
}

// TextStyles
class AppTextStyles {
  // Fuente
  static const String fontFamily = 'Poppins';

  // Tamaños de texto general
  static const double headingSize = 18.0;
  static const double primaryTextSize = 16.0;
  static const double secondaryTextSize = 14.0;

  // Tamaños de texto forms
  static const double labelSize = 16.0;
  static const double inputTextSize = 14.0;
  static const double checkboxTextSize = 14.0;
  static const double switchTextSize = 16.0;

  // Tamaño de texto botones
  static const double buttonTextSize = 18.0;

  // Estilos de texto
  static TextStyle headingTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: headingSize,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );
  static TextStyle appBarTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: headingSize,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle primaryTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: primaryTextSize,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle secondaryTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: secondaryTextSize,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle labelTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: labelSize,
    color: AppColors.textSecondaryColor,
  );

  static TextStyle inputTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: inputTextSize,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle checkboxTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: checkboxTextSize,
    color: AppColors.borderColor,
  );

  static TextStyle switchTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: switchTextSize,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle buttonTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: buttonTextSize,
    color: AppColors.backgroundColor,
  );

  static TextStyle errorTextStyle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: secondaryTextSize,
    color: AppColors.redColor,
  );
}

// Tamaños y Márgenes
class AppDimensions {
  static const double inputFieldHeight = 50.0;
  static const double buttonHeight = 48.0;
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double verticalSpacing = 25.0;
  static const double borderRadius = 12;
  static const double scaffoldPadding = 31.0;
}

// Estilos de Inputs y Botones
class AppDecorations {
  static InputDecoration inputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.inputTextStyle,
      prefixIcon: Icon(icon, color: AppColors.secondaryColor),
      filled: true,
      fillColor: AppColors.backgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    );
  }

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle googleButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.googleButtonColor,
    minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
