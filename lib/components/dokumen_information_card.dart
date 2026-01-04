import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/controllers/offline_controller.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';
import 'package:jdih_mobile_flutter/views/pdf_view_page.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

import 'package:http/http.dart' as http;

class DokumenInformationCard extends StatelessWidget {
  const DokumenInformationCard({
    super.key,
    required this.dokumen,
    required this.textTheme,
  });

  final DetailDokumenModel dokumen;
  final TextTheme textTheme;

  Future<void> lihatDokumen({
    required void Function(String message) onError,
    required void Function(String filePath) onResponse,
    required DetailDokumenModel dokumen,
  }) async {
    if (dokumen.pathPeraturan == null) {
      onError("Maaf, dokumen saat ini tidak tersedia");
      return;
    }

    Get.dialog(
      AlertDialog(
        content: Container(
          height: 60,
          width: 60,
          child: Center(child: CircularProgressIndicator()),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 100),
      ),
    );

    final newUrl = "${Get.find<HttpServer>().apiUrl}/${dokumen.pathPeraturan}";

    log("newUrl: $newUrl");

    final data = await http
        .get(Uri.parse(newUrl))
        .timeout(
          Duration(minutes: 1),
          onTimeout: () async {
            Get.showSnackbar(
              SnackbarUtils.errorSnackbar(text: "Request Timeout"),
            );
            return http.Response("", 403);
          },
        );

    final dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/${dokumen.nama!}");
    File urlFile = await file.writeAsBytes(data.bodyBytes);

    Get.back();
    onResponse(urlFile.path);
    // log(newUrl ?? "");
  }

  Future<void> downloadFile(String url) async {
    final newUrl = "${Get.find<HttpServer>().apiUrl}/${url}";

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
          fileName: "${dokumen.namaDokumen}_${now.millisecondsSinceEpoch}.pdf",
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
        print('Download ID: $taskId');
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
    // Inject OfflineController
    final offlineController = Get.find<OfflineController>();

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
                    dokumen.judul ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTimeParse.getTanggalToDisplay(
                          dokumen.tanggalDitetapkan ?? '',
                        ),
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.visibility, size: 12),
                          SizedBox(width: 8),
                          Text(
                            dokumen.dibaca ?? "0",
                            style: textTheme.bodySmall!.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.download, size: 12),
                          SizedBox(width: 8),
                          Text(
                            dokumen.didownload ?? "0",
                            style: textTheme.bodySmall!.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika untuk melihat dokumen

                            lihatDokumen(
                              onError: (message) {},
                              onResponse: (filePath) {
                                Get.to(() => PdfViewPage(path: filePath));
                              },
                              dokumen: dokumen,
                            );
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
                            "Lihat Dokumen",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika untuk melihat dokumen

                            downloadFile(dokumen.pathPeraturan!);
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
                  SizedBox(height: 8),
                  // Tombol Simpan Offline
                  Obx(() {
                    final dokumenId = dokumen.id ?? "";
                    final isOffline = offlineController.isDokumenOffline(dokumenId);
                    final isDownloading = offlineController.isDokumenDownloading(dokumenId);
                    final progress = offlineController.getDownloadProgress(dokumenId);

                    if (isDownloading) {
                      // Sedang download - tampilkan progress
                      return Column(
                        children: [
                          LinearProgressIndicator(value: progress),
                          SizedBox(height: 4),
                          Text(
                            "Mengunduh... ${(progress * 100).toStringAsFixed(0)}%",
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          ),
                        ],
                      );
                    } else if (isOffline) {
                      // Sudah offline - tombol untuk melihat dokumen offline dan hapus
                      return Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Ambil dokumen offline dan buka dari local storage
                                final offlineDokumen = offlineController.getDokumenOffline(dokumenId);
                                if (offlineDokumen != null && offlineDokumen.localFilePath != null) {
                                  Get.to(() => PdfViewPage(path: offlineDokumen.localFilePath!));
                                } else {
                                  Get.showSnackbar(
                                    SnackbarUtils.errorSnackbar(
                                      text: "File offline tidak ditemukan",
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.all(4),
                                minimumSize: Size(0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.offline_pin, size: 14),
                                  SizedBox(width: 4),
                                  Text(
                                    "Lihat Dokumen Offline",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          // Tombol hapus offline
                          ElevatedButton(
                            onPressed: () async {
                              // Konfirmasi hapus
                              final confirm = await Get.dialog<bool>(
                                AlertDialog(
                                  title: Text("Hapus Dokumen Offline?"),
                                  content: Text("Dokumen akan dihapus dari penyimpanan offline. Anda bisa menyimpannya lagi nanti."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Get.back(result: false),
                                      child: Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.back(result: true),
                                      child: Text("Hapus", style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true) {
                                await offlineController.hapusDokumenOffline(dokumenId);
                                Get.showSnackbar(
                                  SnackbarUtils.successSnackbar(
                                    text: "Dokumen offline berhasil dihapus",
                                    title: "Sukses",
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              minimumSize: Size(0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Icon(Icons.delete, size: 14),
                          ),
                        ],
                      );
                    } else {
                      // Belum offline - tombol untuk simpan
                      return ElevatedButton(
                        onPressed: () async {
                          if (dokumen.pathPeraturan == null) {
                            Get.showSnackbar(
                              SnackbarUtils.errorSnackbar(
                                text: "Maaf, dokumen tidak tersedia",
                              ),
                            );
                            return;
                          }

                          final fileUrl = "${Get.find<HttpServer>().apiUrl}/${dokumen.pathPeraturan}";

                          final success = await offlineController.simpanDokumenOffline(
                            dokumen: dokumen,
                            fileUrl: fileUrl,
                          );

                          if (success) {
                            Get.showSnackbar(
                              SnackbarUtils.successSnackbar(
                                text: "Dokumen berhasil disimpan offline",
                                title: "Sukses",
                              ),
                            );
                          } else {
                            Get.showSnackbar(
                              SnackbarUtils.errorSnackbar(
                                text: "Gagal menyimpan dokumen offline",
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(4),
                          minimumSize: Size(double.infinity, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.offline_pin, size: 14),
                            SizedBox(width: 4),
                            Text(
                              "Simpan Offline",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
