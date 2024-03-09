import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  TextEditingController? controller;
  final String? hintText;

  Text? label;
  double? textfontSize;
  MyInputField({
    super.key,
    this.controller,
    this.hintText,
    this.textfontSize,
    IconData? icon,
    InputDecoration? decoration,
    this.label,
  });

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  MyInputField inputField = MyInputField();
  IconData? icon;
  double? textfontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        controller: widget.controller,
        decoration: InputDecoration(
          label: widget.label,
          suffixStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
  }
}
