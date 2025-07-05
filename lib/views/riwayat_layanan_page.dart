import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/components/layanan_card.dart';
import 'package:jdih_mobile_flutter/controllers/instansi_controller.dart';
import 'package:jdih_mobile_flutter/controllers/layanan_controller.dart';
import 'package:jdih_mobile_flutter/models/riwayat_layanan_model.dart';
import 'package:jdih_mobile_flutter/views/detail_instansi_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RiwayatLayananPage extends StatelessWidget {
  RiwayatLayananPage({super.key});

  final controller = Get.put(LayananController());

  @override
  Widget build(BuildContext context) {
    controller.getListRiwayatLayanan();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          "Riwayat Layanan",
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
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => Skeletonizer(
                    enabled: controller.layanan.isEmpty,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // padding: EdgeInsets.symmetric(horizontal: 32),
                      itemCount: controller.layanan.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Get.to(() => DetailDokumenPage(
                            //       dokumen:
                            //           controller.artikels.elementAt(index),
                            //     ));
                          },
                          child: LayananCard(
                            layanan: controller.layanan[index],
                          ),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.getListRiwayatLayanan();
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
        ],
      ),
    );
  }
}
