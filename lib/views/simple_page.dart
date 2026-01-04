import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/category_bottomsheet.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_dokumen_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/dokumen_card.dart';

class SimplePage extends StatelessWidget {
  SimplePage({
    super.key,
    required this.title,
    required this.jenisId,
    required this.keyword,
    this.tahun = "",
    this.no = "",
    // this.tahun,
    // this.no,
  });

  final controller = Get.find<DokumenController>();
  final String title, keyword, jenisId;
  String tahun, no;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    controller.getTestJdih(keyword, jenisId, tahun, no);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container(height: 2, color: Colors.green)),
              Expanded(child: Container(height: 2, color: Colors.blue)),
              Expanded(child: Container(height: 2, color: Colors.yellow)),
              Expanded(child: Container(height: 2, color: Colors.red)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Obx(
              () => Text(
                "Ditemukan: ${controller.test.length} dokumen.\nKategori: ${jenisId.isEmpty ? '-' : jenisId}\nTahun: ${tahun.isEmpty ? '-' : tahun}\nNomor: ${no.isEmpty ? '-' : no}",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Obx(
                  //   () =>
                  //       controller.categories.isEmpty
                  //           ? Center(child: CircularProgressIndicator())
                  //           : Padding(
                  //             padding: EdgeInsets.symmetric(
                  //               horizontal: 16,
                  //               vertical: 16,
                  //             ),
                  //             child: InkWell(
                  //               onTap: () {
                  //                 Get.bottomSheet(
                  //                   CategoryBottomsheet(
                  //                     stat: controller.stat,
                  //                     category: controller.categories,
                  //                     filterField: filterField,
                  //                   ),
                  //                   isScrollControlled: true,
                  //                   backgroundColor: Colors.white,
                  //                 );
                  //               },
                  //               child: Container(
                  //                 padding: EdgeInsets.symmetric(
                  //                   horizontal: 16,
                  //                   vertical: 8,
                  //                 ),
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   border: Border.all(color: Colors.black),
                  //                 ),
                  //                 width: double.infinity,
                  //                 child: Row(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     Obx(
                  //                       () => Text(
                  //                         controller.selectedCategory.value ==
                  //                                 null
                  //                             ? '-'
                  //                             : controller
                  //                                     .selectedCategory
                  //                                     .value
                  //                                     ?.name ??
                  //                                 "-",
                  //                         style: GoogleFonts.poppins(
                  //                           fontSize: 12,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(width: 8),
                  //                     Container(
                  //                       decoration: BoxDecoration(
                  //                         color: Colors.green,
                  //                         borderRadius: BorderRadius.circular(
                  //                           10,
                  //                         ),
                  //                       ),
                  //                       padding: EdgeInsets.symmetric(
                  //                         horizontal: 8,
                  //                         vertical: 2,
                  //                       ),
                  //                       child: Obx(
                  //                         () =>
                  //                             controller
                  //                                             .selectedCategory
                  //                                             .value !=
                  //                                         null &&
                  //                                     controller.stat.isNotEmpty
                  //                                 ? Text(
                  //                                   controller.stat
                  //                                       .firstWhere(
                  //                                         (p0) =>
                  //                                             p0['name'] ==
                  //                                             controller
                  //                                                 .selectedCategory
                  //                                                 .value!
                  //                                                 .name!,
                  //                                       )['total']
                  //                                       .toString(),
                  //                                   style: GoogleFonts.poppins(
                  //                                     fontSize: 8,
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                 )
                  //                                 : SizedBox(),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  // ),
                  SizedBox(height: 16),
                  Obx(
                    () => Skeletonizer(
                      enabled: controller.test.isEmpty,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // padding: EdgeInsets.symmetric(horizontal: 32),
                        itemCount: controller.test.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    () => DetailDokumenPage(
                                      dokumen: controller.test.elementAt(index),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: DokumenCard(
                                    dokumen: controller.test[index],
                                    textTheme: textTheme,
                                    // type: jenisStatistik,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 6,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                    () =>
                        controller.isLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.getTestJdih(
                                    keyword,
                                    jenisId,
                                    tahun,
                                    no,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.all(4),
                                  minimumSize: Size(0, 0),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Load More",
                                  style: GoogleFonts.poppins(fontSize: 10),
                                ),
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
