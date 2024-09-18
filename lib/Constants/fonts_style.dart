import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // H2 - Bold
  static TextStyle h2({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // H3 - Bold
  static TextStyle h3({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // H4 - Bold
  static TextStyle h4({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // H5 - SemiBold
  static TextStyle h5({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // T2 - SemiBold
  static TextStyle t2({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // Button - SemiBold
  static TextStyle button({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // T3 - Regular (14px)
  static TextStyle t3Regular({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // T3 - Regular (13px)
  static TextStyle t3Small({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }

  // T1 - SemiBold
  static TextStyle t1({required Color color}) {
    return GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.5,
      textStyle: TextStyle(
        color: color,
        decoration: TextDecoration.none,
      ),
    );
  }
}
