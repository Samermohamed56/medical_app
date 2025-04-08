import 'package:flutter/material.dart';

class CustemTextField extends StatelessWidget {
  const CustemTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.isPassword,
    this.validator,
    this.controller,
    this.focusNode,
    this.autoFocus,
  });
  final bool? autoFocus;
  final String hintText;
  final Function(String)? onChanged;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode; // Added focusNode parameter
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        autofocus: autoFocus ?? false,
        focusNode: focusNode,
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          label: Text(hintText),
          labelStyle: TextStyle(color: Color(0xff6C7278), fontSize: 20),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(
              0xff6C7278,
            ), // Make sure this color is visible against your background
            fontSize: 16,
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(226, 255, 255, 255),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
      ),
    );
  }
}
