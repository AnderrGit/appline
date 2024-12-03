// lib/atoms/checkbox_field_atom.dart
import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CheckboxFieldAtom extends StatelessWidget {
  const CheckboxFieldAtom({
    super.key,
    required this.formControlName,
    required this.label,
  });
  final String formControlName;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return ReactiveCheckboxListTile(
      formControlName: formControlName,
      title: label,
      fillColor: WidgetStateProperty.all(Colors.white),
      checkColor: AppColors.textPrimaryColor,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      showErrors: (FormControl<bool> control) =>
          control.invalid && control.touched,
    );
  }
}
