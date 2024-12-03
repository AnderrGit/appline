import 'package:appline/app/core/design/constants.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputFieldAtom extends StatefulWidget {
  const InputFieldAtom({
    super.key,
    required this.formControlName,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
    required this.validationMessages,
    this.maxLength,
    this.maxLines = 1,
    this.textInputAction,
  });

  final String formControlName;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? hintText;
  final Map<String, String Function(Object)> validationMessages;
  final int? maxLength;
  final int maxLines;
  final TextInputAction? textInputAction;

  @override
  InputFieldAtomState createState() => InputFieldAtomState();
}

class InputFieldAtomState extends State<InputFieldAtom> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.label, style: AppTextStyles.labelTextStyle),
        const SizedBox(height: 5),
        ReactiveTextField<String>(
          autofocus: false,
          formControlName: widget.formControlName,
          keyboardType: widget.maxLines > 1
              ? TextInputType.multiline
              : widget.keyboardType,
          obscureText: widget.isPassword && _obscureText,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          decoration: _buildInputDecoration(),
          validationMessages: widget.validationMessages,
          textInputAction: widget.textInputAction,
          style: AppTextStyles.inputTextStyle,
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: AppTextStyles.labelTextStyle,
      errorStyle: AppTextStyles.errorTextStyle,
      fillColor: AppColors.whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        borderSide: const BorderSide(color: AppColors.greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        borderSide: const BorderSide(color: AppColors.greyColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        borderSide: const BorderSide(color: AppColors.secondaryColor),
      ),
      suffixIcon: widget.isPassword
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.greyColor,
              ),
              onPressed: _togglePasswordVisibility,
            )
          : null,
      counterText: widget.maxLength != null ? '${widget.maxLength}' : null,
    );
  }
}
