import 'package:EzNutri/common/functions/execute_with_error_handling.dart';
import 'package:EzNutri/common/widgets/input_fields/input_field.dart';
import 'package:EzNutri/common/widgets/input_fields/password_field.dart';
import 'package:EzNutri/main.dart';
import 'package:flutter/material.dart';

void passwordEmailLogin(
    {required BuildContext context,
    required InputField emailField,
    required PasswordInputField passwordField}) {
  executeWithErrorHandling(
      type: FunctionType.async,
      context: context,
      action: () async {
        await supabase.auth.signInWithPassword(
            email: emailField.controller.text.trim(),
            password: passwordField.passwordController.text);
      });
}
