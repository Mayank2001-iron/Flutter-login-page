import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Button1 extends StatelessWidget {
  String label;
  Function() onTap;

  Button1({
    super.key,
    required this.label,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
                  decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    label,
                    style: GoogleFonts.tiltNeon(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}