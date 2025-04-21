import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final String? value;
  final String hint;
  final String? label;
  final TextInputType? keyboardType;
  final bool autofocus;

  InputField(
      {super.key,
      required this.hint,
      this.label,
      this.value,
      this.keyboardType,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      controller.text = value.toString();
    }
    return TextFormField(
        cursorOpacityAnimates: true,
        autofocus: autofocus,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: hint,
          labelText: label ?? hint,
        ));
  }
}
