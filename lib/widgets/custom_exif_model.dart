import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum OnWhere {
  start,
  center,
  end,
}

class CustomExifModel extends StatelessWidget {
  final String text1;
  final String text2;
  final OnWhere onWhere;
  const CustomExifModel({
    super.key,
    required this.text1,
    required this.text2,
    required this.onWhere,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: onWhere == OnWhere.start
          ? CrossAxisAlignment.start
          : onWhere == OnWhere.end
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: GoogleFonts.inter(
            color: const Color(0xFF979797),
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          text2,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
