import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Color> gradientColors;

  const FeatureItem({
    required this.icon,
    required this.title,
    required this.gradientColors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Icon(icon, size: 24, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 12.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}