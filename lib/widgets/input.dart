import 'package:flutter/material.dart';

class InputAmount extends StatelessWidget {

  final String placeholder;
  final TextEditingController controller;

  const InputAmount({required this.placeholder, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10)),
    );
  }
}
