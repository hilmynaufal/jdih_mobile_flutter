import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/berita_controller.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_artikel_page.dart';
import 'package:jdih_mobile_flutter/views/detail_berita_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BertitaSliderWidget extends StatelessWidget {
  BertitaSliderWidget({super.key});

  final controller = Get.find<BeritaController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final theme = Get.theme;

    if (controller.beritas.isEmpty) {
      controller.getBeritas();
    }

    return Obx(() {
      return Skeletonizer(
        enabled: controller.beritas.isEmpty,
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                controller.beritas.isEmpty
                    ? 2 // tampilkan 2 skeleton jika data kosong
                    : controller.beritas.length,
            itemBuilder: (context, index) {
              final isSkeleton = controller.beritas.isEmpty;
              final curentArtikel =
                  isSkeleton ? null : controller.beritas.elementAt(index);

              return InkWell(
                onTap:
                    isSkeleton
                        ? null
                        : () {
                          Get.to(
                            () => DetailBeritaPage(
                              berita: controller.beritas.elementAt(index),
                            ),
                          );
                        },
                child: SizedBox(
                  width: screenWidth - 8, //add padding
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
                          child:
                              isSkeleton
                                  ? Container(color: Colors.grey[300])
                                  : Image.network(
                                    curentArtikel!.gambar ?? "",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  isSkeleton
                                      ? Container(
                                        width: 120,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      )
                                      : Text(
                                        curentArtikel!.judul ?? "",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                  SizedBox(height: 4),
                                  isSkeleton
                                      ? Container(
                                        width: 80,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      )
                                      : Text(
                                        DateTimeParse.getTanggalToDisplay(
                                          curentArtikel!.tanggal ?? "",
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
    });
  }
}
