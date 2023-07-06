import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    this.icon,
    this.hint,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.obscureTextIcon = true,
    this.suffixIcon,
    this.suffix,
    this.controller,
  });
  final String label;
  final String? hint;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool obscureTextIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: onSaved,
          validator: validator,
          obscureText: obscureText,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 24,
            ),
            labelText: label,
            hintText: hint ?? "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            enabled: true,
            prefixIcon: icon == null ? null : Icon(icon),
            prefixIconColor: Colors.white,
            errorStyle: const TextStyle(fontSize: 10),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
