import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomQuery extends StatelessWidget {
  final String text;
  final bool isTap;
  const CustomQuery({super.key, required this.text, this.isTap = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isTap ? const Color(0xFFEDEDED) : const Color(0xFF7300FF),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: isTap ? FontWeight.w300 : FontWeight.w500,
            fontSize: 12,
            color: isTap ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
