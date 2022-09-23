import 'package:flutter/material.dart';

class DefaultFormFieldArea extends StatelessWidget {
  DefaultFormFieldArea({
    super.key,
    required this.hintText,
    this.maxLines,
    required this.controller,
    this.validationText,
  });
  final String hintText;
  int? maxLines;
  final String? validationText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines == null ? null : maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        }
      },
    );
  }
}
