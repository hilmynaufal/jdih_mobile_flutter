import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/artikel_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/photo_viewer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/utils/simple_multicolored_line.dart';

class DetailArtikelPage extends StatelessWidget {
  const DetailArtikelPage({
    super.key,
    required this.artikel,
    this.isStatic = false,
  });
  const DetailArtikelPage.fromStatic({
    super.key,
    required this.artikel,
    this.isStatic = true,
  });

  final ArtikelModel artikel;
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
                        "${artikel.namaArtikel}",
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
                    () => PhotoViewer(
                      galleryItems: [
                        artikel.imageArticle?.replaceFirst(
                              "https://ppid.bandungkab.go.id/",
                              "${Get.find<HttpServer>().apiUrl}",
                            ) ??
                            "",
                      ],
                    ),
                  );
                },
                child: Image.network(
                  artikel.imageArticle?.replaceFirst(
                        "https://ppid.bandungkab.go.id/",
                        "${Get.find<HttpServer>().apiUrl}",
                      ) ??
                      "",
                ),
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
                artikel.deskripsiArtikel ?? "",
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
                    "Nama Instansi",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${artikel.namaInstansi}",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Jenis Dokumen",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${artikel.jenisArtikel}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Jenis PPID",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${artikel.jenisPpid}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Jenis Informasi",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${artikel.jenisInformasi}",
                    style: GoogleFonts.poppins(fontSize: 14),
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
                    DateTimeParse.getTanggalToDisplay(
                      artikel.createdDate ?? '',
                    ),
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

  Widget buildWidgetStatic(BuildContext context) {
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
                        "${artikel.namaArtikel}",
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
                    () =>
                        PhotoViewer(galleryItems: [artikel.imageArticle ?? ""]),
                  );
                },
                child: Image.network(artikel.imageArticle!),
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
                artikel.deskripsiArtikel ?? "",
                textStyle: GoogleFonts.poppins(letterSpacing: 0.5),
              ),
              // Text(
              //   "${artikel.deskripsiArtikel}",
              //   style: GoogleFonts.poppins(fontSize: 12),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isStatic) {
      return buildWidget(context);
    } else {
      return buildWidgetStatic(context);
    }
  }
}
