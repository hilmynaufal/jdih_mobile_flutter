import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/models/dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/utils/dummy.dart';

import '../components/dokumen_information_card.dart';

class DetailDokumenPage extends StatelessWidget {
  DetailDokumenPage({super.key, required this.dokumen});

  final DetailDokumenModel dokumen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
                        "${dokumen.namaDokumen}",
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
                    dokumen.judul ?? "-",
                    textStyle: GoogleFonts.poppins(letterSpacing: 0.5),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Detail Dokumen",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tipe Dokumen",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.jenisDokumen}",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "T.E.U Badan / Pangarang",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.subjek}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nomor Peraturan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.no}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Jenis / Bentuk Peraturan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.jenisNama}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Singkatan Jenis / Bentuk Peraturan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.jenisNama}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tempat Penempatan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.tempatPenetapan}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tanggal Penempatan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.tanggalDitetapkan}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  // Text(
                  //   Dummy.getFileSizeString(
                  //     bytes: int.parse(dokumen.ukuranDokumen ?? "0"),
                  //   ),
                  //   style: GoogleFonts.poppins(fontSize: 14),
                  // ),
                  SizedBox(height: 8),
                  Text(
                    "Sumber",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.sumber}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  // Text(
                  //   DateTimeParse.getTanggalToDisplay(
                  //     dokumen.createdDate ?? '',
                  //   ),
                  //   style: GoogleFonts.poppins(fontSize: 14),
                  // ),
                  SizedBox(height: 8),
                  Text(
                    "Subjek",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    // DateTimeParse.getTanggalToDisplay(dokumen.updateDate ?? ''),
                    '-',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Status Peraturan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text('-', style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Status",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.statusNama}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Bahasa",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.bahasa}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lokasi",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.lokasi}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Bidang Hukum",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.bidangHukum}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Abstrak",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.abstrak}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "English Version",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Kode Lampiran",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${dokumen.kodeLampiran}",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nomor Panggil",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Cetakan Edisi",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Tempat Terbit",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Penerbit",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Tahun Terbit",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Deskripsi Fisik",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "ISBN",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Nomor Induk",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                  Text(
                    "Jenis Peradilan",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text("-", style: GoogleFonts.poppins(fontSize: 14)),
                  SizedBox(height: 8),
                ],
              ),
              SizedBox(height: 16),
              DokumenInformationCard(dokumen: dokumen, textTheme: textTheme),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
