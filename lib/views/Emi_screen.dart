import 'package:account/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmiScreen extends StatelessWidget {
  const EmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("EMI's",style: AppStyles().appBarStyle),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.phone_android,size: 35),
                title: Text("Poco X7 Pro",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 16.sp)),
                subtitle: Text("EMI : 2 / 12",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14.sp)),
              ),
            );
          }
      ),
    );
  }
}
