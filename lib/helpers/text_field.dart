import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscure;

  const MyTextField({
    super.key,
    this.icon,
    this.hintText,
    this.controller,
    this.obscure = false,
    InputDecoration? decoration,
    required String labelText,
  });
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        obscureText: obscure!,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.brown),
          prefixIcon: Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
