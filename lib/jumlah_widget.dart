import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_dokumen_page.dart';
import 'package:jdih_mobile_flutter/views/simple_page.dart';

class JumlahWidget extends StatelessWidget {
  JumlahWidget({super.key, required this.textTheme});

  final dokumenController = Get.find<DokumenController>();

  final TextTheme textTheme;

  String buildType = 'scroll';

  JumlahWidget.buildWithGrid({required this.textTheme, super.key}) {
    buildType = 'grid';
  }

  Widget buildGrid() {
    return Obx(() {
      if (dokumenController.kategori.isEmpty) {
        return SizedBox();
      }
      return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Menampilkan 3 data per baris
          childAspectRatio: 3 / 2.6, // Sesuaikan dengan kebutuhan Anda
        ),
        itemCount: dokumenController.kategori.length,
        itemBuilder: (context, index) {
          final item = dokumenController.kategori[index];
          return InkWell(
            onTap:
                () => Get.to(
                  () => SimplePage(
                    title: item.jenisNama ?? "",
                    jenisKeterangan: item.jenisKeterangan ?? "",
                    keyword: '',
                  ),
                ),
            child: Container(
              margin: EdgeInsets.all(4), // Sesuaikan dengan kebutuhan Anda
              decoration: BoxDecoration(
                color:
                    colors[index % colors.length]
                        .shade600, // Menggunakan modulo untuk mengulang warna
                borderRadius: BorderRadius.circular(
                  10,
                ), // Buat corner nya radius 10
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${item.jml}', // Mengubah teks menjadi dinamis berdasarkan index
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${item.jenisNama}', // Mengubah teks menjadi dinamis berdasarkan index
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // dokumenController.getTestJdih();
    if (buildType == 'grid') {
      return buildGrid();
    }
    return Obx(() {
      if (dokumenController.kategori.isEmpty) {
        dokumenController.getJdihKategori();
        return SizedBox(child: Text("data"));
      }
      return Container(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dokumenController.kategori.length,
          itemBuilder: (context, index) {
            final item = dokumenController.kategori[index];
            return InkWell(
              onTap:
                  () => Get.to(
                    () => SimplePage(
                      title: item.jenisNama ?? "",
                      jenisKeterangan: item.jenisKeterangan ?? "",
                      keyword: '',
                    ),
                  ),
              child: Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index == dokumenController.kategori.length - 1 ? 4 : 8,
                ),
                width: 120, // Sesuaikan dengan kebutuhan Anda
                decoration: BoxDecoration(
                  color:
                      colors[index % colors.length]
                          .shade600, // Menggunakan modulo untuk mengulang warna
                  borderRadius: BorderRadius.circular(
                    10,
                  ), // Buat corner nya radius 10
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${item.jml}', // Mengubah teks menjadi dinamis berdasarkan index
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${item.jenisNama}', // Mengubah teks menjadi dinamis berdasarkan index
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  static final colors = [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.purple,
    Colors.orange,
  ];
  static final texts = [
    "Jumlah Dokumen Tersedia",
    "Jumlah Dokumen Dilihat",
    "Jumlah Dokumen Diunduh",
  ];
}
