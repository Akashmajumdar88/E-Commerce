import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_theme.dart';
import '../../widgets/common_field.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.secondary,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.10),
                    const Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person,color: AppColors.primary,size: 50),
                        ),
                        Positioned(
                            right: 0,
                            child: Icon(Icons.edit,size: 24,color: Colors.black))
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                width: size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "User Name",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "xyz@Gmail.com",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.phone,
                      hintText: "9876543210",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "PUCS3023C",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "Male",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "1-5 lacs",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "Father's Name",
                    ),
                    SizedBox(height: size.height * 0.03),
                    CommonField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hintText: "Mother's Name",
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}