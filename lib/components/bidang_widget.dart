import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/views/simple_page.dart';

class BidangWidget extends StatelessWidget {
  BidangWidget({super.key});

  final judul = [
    "Pendidikan",
    "Ketenaga Kerjaan",
    "Desa",
    "Infrastruktur",
    "Kerasipan",
    "Kepegawaian",
    "Kependudukan",
    "Kesehatan",
    "Keuangan",
    "Pemerintahan",
    "Lingkungan",
    "Politik",
  ];

  final imagePath = [
    "assets/slider/anaksd.png",
    "assets/slider/pegawai.png",
    "assets/slider/desa.png",
    "assets/slider/infrastruktur.png",
    "assets/slider/arsip.png",
    "assets/slider/pns.png",
    "assets/slider/warga.png",
    "assets/slider/kesehatan.png",
    "assets/slider/uang.png",
    "assets/slider/pemerintahan.png",
    "assets/slider/lingkungan.png",
    "assets/slider/politik.png",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.8,
      ),
      itemCount: judul.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(
              () => SimplePage(
                title: judul[index],
                jenisKeterangan: '',
                keyword: judul[index],
              ),
            );
          },
          child: Card(
            elevation: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 160,
                    child: Image.asset(imagePath[index], fit: BoxFit.cover),
                  ),
                  SizedBox(height: 16),
                  Text(judul[index], style: GoogleFonts.poppins(fontSize: 16)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
