import 'package:flutter/material.dart';
import 'package:EzNutri/common/functions/execute_with_error_handling.dart';
import 'package:EzNutri/common/widgets/buttons/text_button.dart';
import 'package:EzNutri/common/widgets/input_fields/password_field.dart';
import 'package:EzNutri/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePassword extends StatelessWidget {
  final PasswordInputField newPasswordField =
      PasswordInputField(hint: "New Password");
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: newPasswordField,
            ),
            const SizedBox(height: 12),
            ButtonText(
                text: "Reset Password",
                onPressed: () => executeWithErrorHandling(
                    type: FunctionType.async,
                    context: context,
                    action: () async {
                      await supabase.auth.updateUser(UserAttributes(
                        password: newPasswordField.passwordController.text,
                      ));
                    })),
          ],
        ),
      ),
    );
  }
}
