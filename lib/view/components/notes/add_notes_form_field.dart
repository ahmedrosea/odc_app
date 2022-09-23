import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget addNotesFormField({
  String? label,
  required TextEditingController controller,
  int? maxLines,
  String? hint,
  String? validationText,
}) {
  return TextFormField(
    controller: controller,
    maxLines: maxLines ?? 1,
    validator: (value) {
      if (value!.isEmpty) {
        return validationText;
      }
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(22.0),
      label: label == null
          ? null
          : Text(
              label,
              style: GoogleFonts.poppins(color: Colors.orange),
            ),
      hintText: hint ?? '',
      hintStyle: GoogleFonts.poppins(color: Colors.orange),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
    ),
  );
}
