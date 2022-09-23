import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customHomeCard(
    {required String icon,
    required String text,
    required BuildContext context,
    required String targetScreen}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, targetScreen);
    },
    child: Card(
      elevation: 2.5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icons/$icon.svg',
              width: 45.0,
              color: Colors.orange,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 24.0,
              color: Colors.orange,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
