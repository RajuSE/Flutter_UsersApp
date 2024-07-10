import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class UiUtils {
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();

  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static showSuccessSnackBar(BuildContext context, String message) {
    UiUtils.hideSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

  }
  static showSnackBar(BuildContext context, String message) {
    UiUtils.hideSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static void noInternetSnackBar(BuildContext context) {

    UiUtils.hideSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Internet")));

  }

  static hapticFeedback() {
      HapticFeedback.mediumImpact();
  }

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;


  static void hapticFeedbackHeavyImpact() {
    HapticFeedback.heavyImpact();
  }

  static void hapticFeedbackMedium() {
    HapticFeedback.mediumImpact();
  }

  static void hapticFeedbackLightImpact() {
    HapticFeedback.lightImpact();
  }

  static void hapticFeedbackSelectionClick() {
    HapticFeedback.selectionClick();
  }
}

