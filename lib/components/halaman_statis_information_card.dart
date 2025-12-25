import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/halaman_statis_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

class HalamanStatisInformationCard extends StatelessWidget {
  HalamanStatisInformationCard({
    super.key,
    required this.model,
    required this.textTheme,
  });

  final HalamanStatisModel model;
  final TextTheme textTheme;

  Future<void> downloadFile(String url) async {
    final newUrl = "${Get.find<HttpServer>().apiUrl}asset/foto_banner/$url";

    // Request permission untuk flutter_downloader
    final status = await Permission.manageExternalStorage.request();
    final statusNotification = await Permission.notification.request();

    log(newUrl);

    if (!statusNotification.isGranted) {
      Get.showSnackbar(
        SnackbarUtils.errorSnackbar(
          text: "Izin notifikasi diperlukan untuk menampilkan status download.",
        ),
      );
      return;
    }

    log(status.toString());

    if (true) {
      try {
        final now = DateTime.now();
        final taskId = await FlutterDownloader.enqueue(
          url: newUrl,
          savedDir: "/storage/emulated/0/Download",
          fileName: "${model.judul}_${now.millisecondsSinceEpoch}.pdf",
          saveInPublicStorage: true,
          showNotification: true,
          openFileFromNotification: true,
        );
        Get.showSnackbar(
          SnackbarUtils.successSnackbar(
            text: "Download dimulai",
            title: 'Sukses',
          ),
        );
        log('Download ID: $taskId');
      } catch (e) {
        Get.showSnackbar(SnackbarUtils.errorSnackbar(text: e.toString()));
      }
    } else {
      Get.showSnackbar(
        SnackbarUtils.errorSnackbar(
          text: "Izin penyimpanan diperlukan untuk mengunduh file.",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(FontAwesomeIcons.filePdf, size: 40),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    model.judul ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTimeParse.getTanggalToDisplay(
                          model.tglPosting ?? '',
                        ),
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika untuk download dokumen
                            downloadFile(model.gambar!);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.all(4),
                            minimumSize: Size(0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Download",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
