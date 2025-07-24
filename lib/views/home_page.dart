import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/components/bertita_slider_widget.dart';
import 'package:jdih_mobile_flutter/components/bidang_widget.dart';
import 'package:jdih_mobile_flutter/views/header_widget.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/jumlah_widget.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/views/edit_profile_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  // Jumlah onTapMenu harus sama dengan jumlah titles (10 item)

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final screenWidth = MediaQuery.of(context).size.width;

    controller.getListBeritaTerbaru();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF045464),
        // forceMaterialTransparency: true,
        centerTitle: true,
        title: Image.asset("assets/logo.png", scale: 6),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                // SizedBox(height: 16),
                GetX<SharedPrefs>(
                  builder: (sharedPref) {
                    if (sharedPref.modelUser.value == null) {
                      return SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
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
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(color: Colors.pink, width: 4),
                          SizedBox(width: 4),
                          Text(
                            'Informasi',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  16, // Mengubah ukuran font header menjadi 18
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              controller.isMenuExpanded.toggle();
                            },
                            child: Icon(Icons.list, color: theme.primaryColor),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(() {
                    if (controller.isMenuExpanded.value == true) {
                      controller.animationController.forward(from: 0);
                      return Container(
                        margin: EdgeInsets.only(bottom: 32),
                        child: FadeTransition(
                          opacity: controller.animation,
                          child: HeaderWidget.buildExpanded(theme: theme),
                        ),
                      );
                    }
                    return HeaderWidget(theme: theme);
                  }),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(color: Colors.orange, width: 4),
                            SizedBox(width: 4),
                            Text(
                              'Berita Terbaru',
                              style: GoogleFonts.poppins(
                                fontSize:
                                    16, // Mengubah ukuran font header menjadi 18
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    BertitaSliderWidget(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(color: Colors.green, width: 4),
                          SizedBox(width: 4),
                          Text(
                            'Kategori',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  16, // Mengubah ukuran font header menjadi 18
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              controller.isKategoriMenuExpanded.toggle();
                            },
                            child: Icon(Icons.list, color: theme.primaryColor),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                    () =>
                        controller.isKategoriMenuExpanded.value
                            ? FadeTransition(
                              opacity:
                                  controller.animationController
                                    ..forward(from: 0),
                              child: JumlahWidget.buildWithGrid(
                                textTheme: textTheme,
                              ),
                            )
                            : JumlahWidget(textTheme: textTheme),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: BidangWidget(),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
