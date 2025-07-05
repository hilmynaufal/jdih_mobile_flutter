import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/instansi_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_instansi_page.dart';

class InstansiPage extends StatelessWidget {
  InstansiPage({super.key});

  final controller = Get.put(InstansiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          "Daftar Instansi",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Obx(() {
          if (controller.instansis.isEmpty) {
            controller.getInstansiList();
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.instansis.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap:
                    () => Get.to(
                      () => DetailInstansiPage(
                        instansi: controller.instansis[index],
                      ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.building_2_fill, size: 32),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              controller.instansis[index].name ?? "",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
