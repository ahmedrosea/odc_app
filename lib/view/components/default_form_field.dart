import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  DefaultFormField({
    super.key,
    required this.hintText,
    this.isPassword,
    this.prefex,
    this.maxLines,
    required this.controller,
    this.validationText,
  });
  final String hintText;
  bool? isPassword;
  Icon? prefex;
  int? maxLines;
  final String? validationText;
  final TextEditingController controller;

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword == null ? false : isHidden,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword == null
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: isHidden == true
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.orange,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.orange,
                      ),
              ),
        prefixIcon: widget.prefex == null ? null : widget.prefex,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return widget.validationText;
        }
      },
    );
  }
}
