import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget DefaultTitle({double? fontSize}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Orange',
        style: GoogleFonts.poppins(
          color: Colors.orange,
          fontSize: fontSize ?? 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        width: 8.0,
      ),
      Text(
        'Digital Center',
        style: GoogleFonts.poppins(
          fontSize: fontSize ?? 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
