import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.height,
    required this.hintText,
    this.autofocus = false,
  });
  final TextEditingController controller;
  final double height;
  final String hintText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        autocorrect: true,
        controller: controller,
        style: const TextStyle(fontSize: 15, color: Colors.black),
        enableSuggestions: true,
        cursorWidth: 1.5,
        autofocus: autofocus,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
