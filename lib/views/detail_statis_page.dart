import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/components/halaman_statis_information_card.dart';
import 'package:jdih_mobile_flutter/controllers/halaman_statis_controller.dart';
import 'package:jdih_mobile_flutter/controllers/riwayat_controller.dart';
import 'package:jdih_mobile_flutter/models/dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/halaman_statis_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/utils/dummy.dart';

import '../components/dokumen_information_card.dart';

class DetailStatisPage extends StatelessWidget {
  DetailStatisPage({super.key, required this.halamanStatisModel});

  final HalamanStatisModel halamanStatisModel;
  final controller = Get.put(HalamanStatisController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    controller.prepareDokumen(
      model: halamanStatisModel,
      onError: (String message) {},
      onResponse: (String filePath) {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            child: Container(width: 2, color: Colors.green),
                          ),
                        ),
                        Expanded(
                          child: Container(width: 2, color: Colors.blue),
                        ),
                        Expanded(
                          child: Container(width: 2, color: Colors.yellow),
                        ),
                        Expanded(child: Container(width: 2, color: Colors.red)),
                      ],
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "${halamanStatisModel.judul}",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keterangan",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  HtmlWidget(
                    halamanStatisModel.isiHalaman ?? "-",
                    textStyle: GoogleFonts.poppins(letterSpacing: 0.5),
                  ),
                  SizedBox(height: 32),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: Obx(() {
                  if (controller.filePath.value == null) {
                    return SizedBox(child: CircularProgressIndicator());
                  }
                  return Container(
                    height: 400,
                    child: PDFView(
                      filePath: controller.filePath.value ?? "",
                      fitPolicy: FitPolicy.WIDTH,
                      // autoSpacing: true,
                      enableSwipe: true,
                      pageSnap: true,
                      swipeHorizontal: true,
                      nightMode: false,
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              HalamanStatisInformationCard(
                model: halamanStatisModel,
                textTheme: textTheme,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
