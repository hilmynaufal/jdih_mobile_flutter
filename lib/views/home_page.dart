import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/controllers/buat_layanan_controller.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/jumlah_widget.dart';
import 'package:jdih_mobile_flutter/login_bottomsheet.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/views/buat_layanan_page.dart';
import 'package:jdih_mobile_flutter/views/coming_soon_page.dart';
import 'package:jdih_mobile_flutter/views/detail_artikel_page.dart';
import 'package:jdih_mobile_flutter/views/edit_profile_screen.dart';
import 'package:jdih_mobile_flutter/views/instansi_page.dart';
import 'package:jdih_mobile_flutter/views/simple_page.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  final List<Function()> onTapMenu = [
    () {
      //on tap menu jenis dokumen
      Get.to(() => ComingSoonPage());
    },
    () {
      //on tap menu PPID utama
      Get.to(() => ComingSoonPage());
    },
    () {
      //on tap menu PPID utama
      Get.to(() => ComingSoonPage());
    },
    () {
      //on tap menu Visi & Misi
      // Get.to(
      //     () => DetailArtikelPage.fromStatic(artikel: Constant.visiMisiStatic));
      Get.to(() => ComingSoonPage());
    },
    () {
      //on tap menu Alur
      Get.to(() => ComingSoonPage());
    },
    () {
      //on tap menu Instansi
      Get.to(() => InstansiPage());
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final screenWidth = MediaQuery.of(context).size.width;

    controller.getListBeritaTerbaru();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Image.asset("assets/logo-full.png", scale: 12),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                // GetX<SharedPrefs>(
                //   builder: (sharedPref) {
                //     if (sharedPref.modelUser.value == null) {
                //       return SizedBox();
                //     }
                //     return Container(
                //         width: double.infinity,
                //         height: 300,
                //         decoration: BoxDecoration(color: theme.primaryColor),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Center(
                //               child: Lottie.asset("assets/sunrise2.json",
                //                   height: 200, width: 200),
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 16),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     "Selamat pagi! ${sharedPref.nama.value}!",
                //                     style: GoogleFonts.poppins(
                //                         color: Colors.white,
                //                         fontSize: 16,
                //                         fontWeight: FontWeight.w600),
                //                   ),
                //                   SizedBox(
                //                     height: 4,
                //                   ),
                //                   Text(
                //                     "Apa yang bisa kami bantu?",
                //                     style: GoogleFonts.poppins(
                //                       color: Colors.grey.shade200,
                //                       fontSize: 12,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             )
                //           ],
                //         ));
                //   },
                // ),
                SizedBox(height: 16),
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
              ],
            ),
            SizedBox(height: 16),
            Obx(() {
              if (controller.isMenuExpanded.value == true) {
                controller.animationController.forward(from: 0);
                return Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: FadeTransition(
                    opacity: controller.animation,
                    child: expandedMenu(),
                  ),
                );
              }

              return SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: InkWell(
                        onTap: () => onTapMenu.elementAt(index)(),
                        child: Container(
                          width: 60,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.grey),
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  icons[index],
                                  color: theme.primaryColor,
                                  size: 30,
                                ),
                              ),
                              SizedBox(height: 4),
                              Flexible(
                                child: Text(
                                  titles[index],
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
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
              );
            }),
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
                        fontSize: 16, // Mengubah ukuran font header menjadi 18
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Obx(() {
              return Skeletonizer(
                enabled: controller.beritaTerbaru.isEmpty,
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        controller
                            .beritaTerbaru
                            .length, // Sesuaikan dengan jumlah item yang ingin ditampilkan
                    itemBuilder: (context, index) {
                      final curentArtikel = controller.beritaTerbaru.elementAt(
                        index,
                      );
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => DetailArtikelPage(
                              artikel: controller.beritaTerbaru.elementAt(
                                index,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: screenWidth,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    curentArtikel.imageArticle!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            curentArtikel.namaArtikel ?? "",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            DateTimeParse.getTanggalToDisplay(
                                              curentArtikel.createdDate ?? "",
                                            ),
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
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
                        fontSize: 16, // Mengubah ukuran font header menjadi 18
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
                            controller.animationController..forward(from: 0),
                        child: JumlahWidget.buildWithGrid(textTheme: textTheme),
                      )
                      : JumlahWidget(textTheme: textTheme),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget expandedMenu() {
    final theme = Get.theme;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () => onTapMenu.elementAt(index)(),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    icons[index],
                    color: theme.primaryColor,
                    size: 30,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titlesExpanded[index],
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        subtitleExpanded[index],
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          // fontWeight: FontWeight.w200,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.right_chevron),
                  iconSize: 16,
                  color: theme.primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<String> titles = [
    'Jenis\nDokumen',
    'PPID Utama',
    'Informasi',
    'Visi & Misi',
    'Alur',
    'Instansi',
  ];

  List<String> titlesExpanded = [
    'Jenis Dokumen',
    'PPID Utama',
    'Informasi',
    'Visi & Misi',
    'Alur',
    'Instansi',
  ];

  List<String> subtitleExpanded = [
    'Cari dokumen yang diurutkan berdasarkan filter Jenis Informasi',
    'Cari dokumen yang diurutkan berdasarkan filter Jenis PPID',
    'Cari dokumen yang diurutkan berdasarkan filter Jenis Informasi',
    'Baca Visi & Misi dari aplikasi PPID kami',
    'Baca Visi & Misi dari aplikasi PPID kami',
    'Cari berbagai informasi dokumen, video dan berita di berbagai instansi',
  ];

  List<IconData> icons = [
    Icons.description,
    Icons.home,
    Icons.info,
    Icons.visibility,
    Icons.route,
    Icons.business,
  ];
}
