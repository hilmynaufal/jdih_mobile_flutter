import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_dokumen_page.dart';

class HukumTerbaruWidget extends StatelessWidget {
  HukumTerbaruWidget({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = Get.width;

    if (controller.hukumTerbaru.isEmpty) {
      controller.getHukumTerbaru();
    }

    return Obx(() {
      final isLoading = controller.hukumTerbaru.isEmpty;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(color: Colors.green, width: 4),
                    SizedBox(width: 4),
                    Text(
                      'Hukum Terbaru',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: isLoading ? 2 : controller.hukumTerbaru.length,
                itemBuilder: (context, index) {
                  final dokumen =
                      isLoading ? null : controller.hukumTerbaru[index];

                  return InkWell(
                    onTap:
                        isLoading
                            ? null
                            : () async {
                              if (dokumen?.id == null) return;

                              // Tampilkan loading dialog
                              Get.dialog(
                                AlertDialog(
                                  content: Container(
                                    height: 60,
                                    width: 60,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 100,
                                  ),
                                ),
                                barrierDismissible: false,
                              );

                              // Fetch detail dokumen
                              final detailDokumen = await controller
                                  .getDetailDokumen(dokumen!.id!);

                              // Tutup loading dialog
                              Get.back();

                              if (detailDokumen != null) {
                                // Navigate ke detail page
                                Get.to(
                                  () =>
                                      DetailDokumenPage(dokumen: detailDokumen),
                                );
                              } else {
                                // Tampilkan error
                                Get.snackbar(
                                  'Error',
                                  'Gagal memuat detail dokumen',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red.shade100,
                                  colorText: Colors.red.shade900,
                                );
                              }
                            },
                    child: Container(
                      width: screenWidth * 0.75,
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.green.shade200,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Jenis Dokumen
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              isLoading
                                  ? 'Loading...'
                                  : dokumen?.jenisNama ?? '-',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Nama Dokumen
                          Expanded(
                            child: Text(
                              isLoading
                                  ? 'Memuat data dokumen hukum...'
                                  : dokumen?.nama ?? '-',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Nomor dan Tahun
                          if (!isLoading && dokumen != null)
                            Text(
                              'No. ${dokumen.no ?? '-'} Tahun ${dokumen.tahun ?? '-'}',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.grey[700],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          SizedBox(height: 8),
                          // Stats: Dibaca dan Didownload
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dibaca
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    size: 14,
                                    color: Colors.green.shade700,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    isLoading ? '0' : dokumen?.dibaca ?? '0',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'dibaca',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              // Didownload
                              Row(
                                children: [
                                  Icon(
                                    Icons.download,
                                    size: 14,
                                    color: Colors.green.shade700,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    isLoading
                                        ? '0'
                                        : dokumen?.didownload ?? '0',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'diunduh',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      );
    });
  }
}
