import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/artikel_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/berita_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/photo_viewer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/utils/simple_multicolored_line.dart';

class DetailBeritaPage extends StatelessWidget {
  DetailBeritaPage({super.key, required this.berita, this.isStatic = false});
  const DetailBeritaPage.fromStatic({
    super.key,
    required this.berita,
    this.isStatic = true,
  });

  final BeritaModel berita;
  final bool isStatic;

  Widget buildWidget(BuildContext context) {
    final theme = Theme.of(context);
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
                    SimpleMulticoloredLine.vertical,
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "${berita.judul}",
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
              InkWell(
                onTap: () {
                  Get.to(
                    () => PhotoViewer(galleryItems: [berita.gambar ?? ""]),
                  );
                },
                child: Image.network(berita.gambar ?? ""),
              ),
              SizedBox(height: 32),
              Text(
                "Keterangan",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              HtmlWidget(
                berita.isiBerita ?? "",
                textStyle: GoogleFonts.poppins(letterSpacing: 0.5),
              ),
              // Text(
              //   "${artikel.deskripsiArtikel}",
              //   style: GoogleFonts.poppins(fontSize: 12),
              // ),
              SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail Artikel",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Uploader",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${berita.username}",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tanggal Diterbitkan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    DateTimeParse.getTanggalToDisplay(berita.tanggal ?? ''),
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }
}
