import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/cari_bottomsheet.dart';
import 'package:jdih_mobile_flutter/category_bottomsheet.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/jumlah_widget.dart';
import 'package:jdih_mobile_flutter/login_bottomsheet.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_dokumen_page.dart';
import 'package:jdih_mobile_flutter/views/simple_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/dokumen_card.dart';

class CariDokumenPage extends StatelessWidget {
  CariDokumenPage({super.key, required this.title});

  final controller = Get.find<DokumenController>();
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // controller.getTestJdih('', jenisKeterangan);

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
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: InkWell(
                      onTap:
                          () => Get.bottomSheet(
                            SingleChildScrollView(child: CariBottomsheet()),
                            ignoreSafeArea: false,
                            shape: const LinearBorder(),
                            isScrollControlled: true,
                            enableDrag: true,
                            backgroundColor: Colors.white,
                          ),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'Cari produk hukum...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                        onSubmitted: (value) {
                          Get.to(
                            () => SimplePage(
                              title: "Cari: $value",
                              jenisId: '',
                              keyword: value,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  JumlahWidget.buildWithGrid(textTheme: textTheme),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
