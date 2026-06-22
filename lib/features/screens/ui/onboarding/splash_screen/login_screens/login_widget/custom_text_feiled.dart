import 'package:flutter/material.dart';

class CustomTextFeiled extends StatelessWidget {
  const CustomTextFeiled({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.enabled,
    this.readOnly = false,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
  });
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool? readOnly;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        label: Text(labelText.toString()),
        hintText: hintText,
        enabled: enabled ?? true,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      initialValue: initialValue,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
