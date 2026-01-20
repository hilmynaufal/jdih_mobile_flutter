// ignore_for_file: prefer_const_constructors

// import 'package:beladiri_flutter/controllers/berita_controller.dart';
// import 'package:beladiri_flutter/screens/detail_pesan_screen.dart';
// import 'package:beladiri_flutter/screens/edit_profile_screen.dart';
// import 'package:beladiri_flutter/utils/shared_prefs.dart';
// import 'package:beladiri_flutter/widgets/item_pesan.dart';
// import 'package:beladiri_flutter/widgets/main_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/bottom_nav_controller.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';

import 'package:jdih_mobile_flutter/views/edit_profile_screen.dart';
import 'package:jdih_mobile_flutter/views/kebijakan_privasi_page.dart';

// import '../widgets/berita_card.dart';
// import '../widgets/berita_headline_card_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.find<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: theme.colorScheme.onPrimary,
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: theme.primaryColor),
                          height: 60,
                        ),
                        Container(
                          width: double.infinity,
                          // decoration: BoxDecoration(color: Colors.orange),
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "DESA, KECAMATAN",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "-",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${controller.nama}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      controller.modelUser.value?.email ?? "",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          width: 68,
                          height: 68,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.primaryColor,
                              ),
                              width: 60,
                              height: 60,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 8,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_add_alt_1_rounded,
                                    size: 64,
                                    color: theme.primaryColor,
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Lengkapi profile-mu Sekarang!",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: theme.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Lengkapi profile-mu agar dapat menjalankan fitur-fitur aplikasi yang lebih luas.",
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => EditProfileScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Lengkapi Profile",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pengaturan Akun",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 32),
                            InkWell(
                              onTap: () => Get.to(() => EditProfileScreen()),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.person_alt_circle,
                                    color: theme.primaryColor,
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Profile Saya",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Divider(
                              // color: Colors.grey.shade200,
                            ),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                Get.to(() => KebijakanPrivasiPage());
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.book_fill,
                                    color: theme.primaryColor,
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Kebijakan Privasi",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Divider(
                              // color: Colors.grey.shade200,
                            ),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                controller.logout();
                                Get.find<BottomNavController>()
                                    .selectedIndex
                                    .value = 0;
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.exit_to_app_rounded,
                                    color: theme.colorScheme.error,
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: theme.colorScheme.error,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: theme.primaryColor,
      //   foregroundColor: theme.colorScheme.onPrimary,
      //   onPressed: () {},
      //   shape: CircleBorder(),
      // ),
    );
  }
}
