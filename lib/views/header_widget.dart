import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_statis_page.dart';

import 'coming_soon_page.dart';

class HeaderWidget extends StatelessWidget {
  final controller = Get.find<DokumenController>();

  final List<Function()> onTapMenu = List.generate(10, (index) {
    return () {
      Get.to(() => ComingSoonPage());
    };
  });

  final ThemeData theme;

  final String buildType;

  HeaderWidget({super.key, required this.theme}) : buildType = 'shrink';

  HeaderWidget.buildExpanded({super.key, required this.theme})
    : buildType = 'expand';

  final List<String> titles = [
    'Dasar Hukum',
    'Visi dan Misi',
    'Struktur Organisasi',
    'Tupoksi',
    'Susunan Tim JDIH',
    'SOP',
    'Berita',
    'Artikel',
    'Kegiatan',
    'FAQ',
  ];

  final List<String> titlesExpanded = [
    'Dasar Hukum',
    'Visi dan Misi',
    'Struktur Organisasi',
    'Tupoksi',
    'Susunan Tim JDIH',
    'SOP',
    'Berita',
    'Artikel',
    'Kegiatan',
    'FAQ',
  ];

  final List<String> subtitleExpanded = [
    'Dasar hukum yang menjadi landasan dalam pengelolaan JDIH Kabupaten Bandung',
    'Visi dan misi JDIH Kabupaten Bandung',
    'Struktur organisasi JDIH Kabupaten Bandung',
    'Tupoksi JDIH Kabupaten Bandung',
    'Susunan tim JDIH Kabupaten Bandung',
    'SOP JDIH Kabupaten Bandung',
    'Berita terbaru dari JDIH Kabupaten Bandung',
    'Artikel terbaru dari JDIH Kabupaten Bandung',
    'Kegiatan terbaru dari JDIH Kabupaten Bandung',
    'FAQ JDIH Kabupaten Bandung',
  ];

  final List<IconData> icons = [
    Icons.gavel, // Dasar Hukum
    Icons.visibility, // Visi dan Misi
    Icons.account_tree, // Struktur Organisasi
    Icons.assignment_ind, // Tupoksi
    Icons.group, // Susunan Tim JDIH
    Icons.rule, // SOP
    Icons.newspaper, // Berita
    Icons.article, // Artikel
    Icons.event, // Kegiatan
    Icons.help_outline, // FAQ
  ];

  @override
  Widget build(BuildContext context) {
    controller.getHalamanStatis();
    if (buildType == "expand") {
      return buildExpanded();
    }
    return Obx(() {
      if (controller.halamanStatis.isEmpty) {
        return SizedBox(child: CircularProgressIndicator());
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4),
          scrollDirection: Axis.horizontal,
          itemCount: controller.halamanStatis.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: InkWell(
                onTap:
                    () => Get.to(
                      () => DetailStatisPage(
                        halamanStatisModel: controller.halamanStatis.elementAt(
                          index,
                        ),
                      ),
                    ),
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
                          controller.halamanStatis[index].judul ?? "",
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
    });
  }

  Widget buildExpanded() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12),
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.halamanStatis.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap:
                () => Get.to(
                  () => DetailStatisPage(
                    halamanStatisModel: controller.halamanStatis[index],
                  ),
                ),
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
                        controller.halamanStatis[index].judul ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${controller.halamanStatis[index].judul} JDIH DPRD Kabupaten Bandung",
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
}
