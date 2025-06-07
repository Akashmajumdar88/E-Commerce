import 'package:account/constants/app_styles.dart';
import 'package:account/constants/app_theme.dart';
import 'package:flutter/material.dart';

class MyDrawer {
  getDrawer(context) {
    return SafeArea(
      child: Drawer(
        width: 260,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0))),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                color: AppColors.secondary,
                child: const FlutterLogo(
                  size: 150,
                  style: FlutterLogoStyle.markOnly,
                  textColor: Colors.blue,
                  duration: Duration(seconds: 2),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.secondary,
                        radius: 18,
                        child:
                            Icon(Icons.search, size: 18, color: Colors.white),
                      ),
                      title: const Text("Search",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          size: 12, color: Color(0xFF001133)),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyInvitesScreen()));
                      },
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.secondary,
                        radius: 18,
                        child: Icon(Icons.notifications_none,
                            size: 18, color: Colors.white),
                      ),
                      title: const Text("Notification",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          size: 12, color: Color(0xFF001133)),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyInterest()));
                      },
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.secondary,
                        radius: 18,
                        child:
                            Icon(Icons.person, size: 18, color: Colors.white),
                      ),
                      title: const Text("Profile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          size: 12, color: Color(0xFF001133)),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyInterest()));
                      },
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                          onPressed: () {
                            onTapLogout(context);
                          },
                          icon: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, size: 24, color: Colors.black),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Logout",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                            ],
                          )),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapLogout(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Are you sure", style: AppStyles().cardTitle),
                const SizedBox(height: 10),
                Text("Do you want to logout", style: AppStyles().cardTitle),
                const SizedBox(height: 10),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text("No",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text("Yes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
