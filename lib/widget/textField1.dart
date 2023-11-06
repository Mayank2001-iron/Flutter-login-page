import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextField1 extends StatelessWidget {
  String label;
  bool obscureText;
  final controller;

  TextField1({
    super.key,
    required this.label,
    required this.obscureText,
    required this.controller,
    });

  @override
  Widget build(BuildContext context) {
    return  TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: label,
                  ),
                  obscureText: obscureText,
              );
  }
}