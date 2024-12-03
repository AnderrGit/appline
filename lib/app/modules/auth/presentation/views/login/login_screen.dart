import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/core/utils/forms/dimiss_keyboard.dart';
import 'package:appline/app/core/utils/forms/input_field_atom.dart';
import 'package:appline/app/core/widgets/custom_button.dart';
import 'package:appline/app/core/widgets/vertical_sizedbox_spacing.dart';
import 'package:appline/app/modules/auth/presentation/views/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Encabezado
                  _buildHeader(),
                  const SizedBox(height: AppDimensions.verticalSpacing),
                  // Formulario
                  _buildForm(),
                  const SizedBox(height: AppDimensions.verticalSpacing),
                  // Pie de página
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Encabezado con el nombre del proyecto y el ícono
  Widget _buildHeader() {
    return Column(
      children: [
        const Icon(
          Icons.apps,
          size: 80,
          color: AppColors.primaryColor,
        ),
        const SizedBox(height: AppDimensions.verticalPadding),
        Text(
          'Appline',
          style: AppTextStyles.headingTextStyle.copyWith(
            color: AppColors.primaryColor,
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  // Formulario de inicio de sesión
  Widget _buildForm() {
    return ReactiveForm(
      formGroup: controller.loginForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputFieldAtom(
            formControlName: 'email',
            label: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'Por favor ingresa tu correo electrónico',
              ValidationMessage.email: (error) =>
                  'Por favor ingresa un correo válido',
            },
          ),
          const VerticalSizedboxSpacing(),
          InputFieldAtom(
            formControlName: 'password',
            label: 'Contraseña',
            isPassword: true,
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'Por favor ingresa tu contraseña',
              ValidationMessage.minLength: (error) =>
                  'La contraseña debe tener al menos 6 caracteres',
            },
          ),
          const VerticalSizedboxSpacing(
            times: 2,
          ),
          ReactiveFormConsumer(
            builder: (context, form, child) {
              return CustomButton(
                onPressed: controller.login,
                text: 'Iniciar Sesión',
                isEnabled: form.valid,
              );
            },
          ),
        ],
      ),
    );
  }

  // Pie de página con texto informativo
  Widget _buildFooter() {
    return Center(
      child: Text(
        '© 2023 Appline. Todos los derechos reservados.',
        style: AppTextStyles.secondaryTextStyle,
      ),
    );
  }
}
