import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final double borderWidth;
  final double borderRadius;
  final TextStyle? hintStyle;
  final TextInputType inputType;
  final bool isEnabled;
  final bool autofocus;
  final bool autocorrect;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixWidget;
  final TextCapitalization textCapitalization;
  final Widget? prefixWidget;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool obSecureText;
  final String? error;
  final Color primaryColor;
  final String? initialValue;

  const AppTextField({
    Key? key,
    required this.hintText,
    this.maxLength,
    this.maxLines,
    this.hintStyle,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.autofocus = false,
    this.autocorrect = true,
    this.inputFormatter,
    this.textAlign = TextAlign.left,
    this.borderWidth = 0.5,
    this.borderRadius = 16.0,
    this.suffixWidget,
    this.textCapitalization = TextCapitalization.none,
    this.prefixWidget,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.obSecureText = false,
    this.error,
    this.validator,
    this.primaryColor = Colors.black,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      autocorrect: autocorrect,
      initialValue: initialValue,
      autofocus: autofocus,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      controller: controller,
      style: const TextStyle(fontSize: 18),
      maxLength: maxLength,
      keyboardType: inputType,
      enabled: isEnabled,
      cursorColor: primaryColor,
      inputFormatters: inputFormatter,
      maxLines: maxLines,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obSecureText,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixWidget,
        prefixIcon: prefixWidget,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        errorText: error,
        errorStyle: const TextStyle(fontSize: 18),
        counterText: '',
        fillColor: isDarkMode ? AppColors.darkBackground : AppColors.otpBgColor,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(color: Colors.grey)
                .copyWith(color: isEnabled ? null : AppColors.disableTextColor),
        enabled: isEnabled,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkRed, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:
            isDarkMode ? AppColors.darkBorderColor : AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
            isDarkMode ? AppColors.darkBorderColor : AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
            isDarkMode ? AppColors.darkBorderColor : AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
