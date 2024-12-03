// lib/atoms/selector_field_atom.dart
import 'package:appline/app/core/design/constants.dart';
import 'package:appline/app/core/widgets/vertical_sizedbox_spacing.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SelectorFieldAtom extends StatelessWidget {
  const SelectorFieldAtom({
    super.key,
    required this.formControlName,
    required this.label,
    required this.items,
    this.hintText = '',
    required this.validationMessages,
  });
  final String formControlName;
  final String label;
  final String hintText;
  final List<String> items;
  final Map<String, String Function(Object)> validationMessages;

  void _showBottomSheet(BuildContext context, FormControl<String> control) {
    showModalBottomSheet(
      backgroundColor: AppColors.whiteColor,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(AppDimensions.verticalPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const VerticalSizedboxSpacing(),
                ...items.map((item) {
                  return ListTile(
                    title: Text(item, style: AppTextStyles.labelTextStyle),
                    onTap: () {
                      control.value = item;
                      Navigator.of(context).pop();
                      // Forzar pérdida de foco después de cerrar el modal
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      // Asegúrate de que ningún campo reciba el foco al salir del modal
      // ignore: use_build_context_synchronously
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelTextStyle,
        ),
        const SizedBox(height: 5),
        ReactiveFormField<String, String>(
          formControlName: formControlName,
          builder: (field) {
            return GestureDetector(
              onTap: () => _showBottomSheet(context, field.control),
              child: InputDecorator(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTextStyles.inputTextStyle,
                  fillColor: AppColors.whiteColor,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.borderRadius),
                    borderSide: const BorderSide(color: AppColors.greyColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.borderRadius),
                    borderSide: const BorderSide(color: AppColors.redColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.borderRadius),
                    borderSide: const BorderSide(color: AppColors.redColor),
                  ),
                  // errorText: field.errorText,
                  // errorStyle: AppTextStyles.inputError,
                ),
                child: Text(field.value ?? hintText,
                    style: AppTextStyles.inputTextStyle),
              ),
            );
          },
          validationMessages: validationMessages,
        ),
      ],
    );
  }
}
