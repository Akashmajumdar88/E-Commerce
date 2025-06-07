import 'package:account/views/cibil_check.dart';
import 'package:account/views/product/product_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_styles.dart';
import '../constants/app_theme.dart';
import '../widgets/common_button.dart';
import '../widgets/drawer_screen.dart';
import '../widgets/quick_action.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,color: Colors.black,size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Home",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.black)),
      ),
      drawer: MyDrawer().getDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Purchases",style: AppStyles().cardTitle),
                  Text("View All",style: AppStyles().viewAllStyles),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            CarouselSlider(
              options: CarouselOptions(
                height: 260,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
              ),
              items: imgList.map((item) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),   // Adjust radius as needed
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                          ),
                          const Positioned(
                              top: 10,
                              left: 10,
                              child: Icon(Icons.favorite,color: Colors.red,size: 20,)),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                                child: const Text("Delivered",style: TextStyle(color: Colors.black,fontSize: 12)),
                              )
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Samsung Galaxy S21 Ultra",
                            style: GoogleFonts.poppins(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("2 days ago",
                            style: GoogleFonts.poppins(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Colors.grey)),
                      )
                    ],
                  ),
                ),
              )).toList(),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              width: size.width,
              child: Card(
                color: Colors.white,
                elevation: 1,
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quick Actions", style: AppStyles().cardTitle),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CibilCheck()));
                            },
                            child: FeatureItem(
                              gradientColors: [
                                Colors.purpleAccent,
                                Colors.purple
                              ],
                              icon: Icons.credit_card,
                              title: "CIBIL\nScore",
                            ),
                          ),
                          FeatureItem(
                            gradientColors: [
                              Colors.greenAccent,
                              Colors.green
                            ],
                            icon: Icons.money,
                            title: "Apply\nfor Loan",
                          ),
                          FeatureItem(
                            gradientColors: [
                              Colors.orangeAccent,
                              Colors.orange
                            ],
                            icon: Icons.phone_android,
                            title: "Replace\nPhone",
                          ),
                          FeatureItem(
                            gradientColors: [
                              Colors.pinkAccent,
                              Colors.pink
                            ],
                            icon: Icons.location_on,
                            title: "Service\nCenter",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.r),
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Colors.purpleAccent,
                    Colors.deepPurple
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upgrade Your Phone Today!",
                      style: GoogleFonts.roboto(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  Text("Trade-in your old device and get up to 70% off on your new purchase",
                      style: GoogleFonts.poppins(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w500)),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(" Explore Offers ",
                        style: GoogleFonts.poppins(fontSize: 16.sp,color: AppColors.primary,fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Center(
                    child: Container(
                      width: size.width / 2.8,
                      height: size.height * 0.12,
                      color: Colors.white,
                      child: const FlutterLogo(
                        size: 70,
                        style: FlutterLogoStyle.markOnly,
                        textColor: Colors.blue,
                        duration: Duration(seconds: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shop Product",style: AppStyles().cardTitle),
                  Text("View All",style: AppStyles().viewAllStyles),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              width: size.width,
              height: 35,
              child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("All Product"),
                    );
                  }),
            ),
            SizedBox(height: size.height * 0.02),
            GridView.builder(
              padding: EdgeInsets.all(10.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                // childAspectRatio: 1.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetail()));
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Set border radius here
                          child: Image.network(
                            "https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                            height: 90,
                            width: size.width,
                            fit: BoxFit.cover, // Ensures the image covers the area
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("Samsung S23 ultra",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14.sp)),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                rating: 4.5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 15.0,
                                direction: Axis.horizontal,
                              ),
                              const Text(" (128)",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₹599",
                                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14.sp)),
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[200],
                                child: const Icon(Icons.shopping_cart,color: AppColors.primary,size: 15,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                        child: Text("Nearby Service Centers",style: AppStyles().cardTitle),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[200],
                            child: const Icon(Icons.location_on,color: AppColors.primary,size: 20,),
                          ),
                          const SizedBox(width: 10),
                          Text("Mobishop service centers",
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18.sp),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text("123, downtown xyz",
                        style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          const Icon(Icons.call,color: Colors.grey,size: 20),
                          const SizedBox(width: 10),
                          Text("+919876543210",
                            style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          const Icon(Icons.alarm,color: Colors.grey,size: 20),
                          const SizedBox(width: 10),
                          Text("9:00 AM - 7:00 PM",
                            style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            height: 35,
                            width: size.width * 0.45,
                            onPressed: () {},
                            title: "Get Directions",
                          ),
                          Container(
                            height: 35,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: AppColors.secondary)
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r), // Rounded corners
                                  )
                              ),
                              child: Text("Call Now",
                                  style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: AppColors.secondary,fontSize: 16.sp)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[200],
                            child: const Icon(Icons.location_on,color: AppColors.primary,size: 20,),
                          ),
                          const SizedBox(width: 10),
                          Text("Mobishop service centers",
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18.sp),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text("123, downtown xyz",
                        style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          const Icon(Icons.call,color: Colors.grey,size: 20),
                          const SizedBox(width: 10),
                          Text("+919876543210",
                            style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          const Icon(Icons.alarm,color: Colors.grey,size: 20),
                          const SizedBox(width: 10),
                          Text("9:00 AM - 7:00 PM",
                            style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            height: 35,
                            width: size.width * 0.45,
                            onPressed: () {},
                            title: "Get Directions",
                          ),
                          Container(
                            height: 35,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: AppColors.secondary)
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r), // Rounded corners
                                  )
                              ),
                              child: Text("Call Now",
                                  style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: AppColors.secondary,fontSize: 16.sp)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
