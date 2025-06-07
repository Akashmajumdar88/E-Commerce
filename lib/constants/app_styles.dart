import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

class AppStyles {
  TextStyle appBarStyle = GoogleFonts.poppins(
      color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500);
  TextStyle hintStyle = GoogleFonts.roboto(
      color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w300);
  TextStyle fillStyle = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle cardTitle = GoogleFonts.roboto(
      fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.bold);
  TextStyle viewAllStyles = GoogleFonts.roboto(
      fontSize: 14.sp, color: AppColors.primary, fontWeight: FontWeight.w500);
}
