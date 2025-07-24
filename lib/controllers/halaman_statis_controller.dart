import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/halaman_statis_model.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import '../http_server.dart';

class HalamanStatisController extends GetxController {
  final filePath = RxnString();

  Future<void> prepareDokumen({
    required void Function(String message) onError,
    required void Function(String filePath) onResponse,
    required HalamanStatisModel model,
  }) async {
    // final dialog = Get.dialog(
    //   AlertDialog(
    //     content: Container(
    //       height: 60,
    //       width: 60,
    //       child: Center(child: CircularProgressIndicator()),
    //     ),
    //     insetPadding: EdgeInsets.symmetric(horizontal: 100),
    //   ),
    // );

    final newUrl =
        "${Get.find<HttpServer>().apiUrl}asset/foto_banner/${model.gambar}";

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
    File file = File("${dir.path}/${model.gambar!}");
    File urlFile = await file.writeAsBytes(data.bodyBytes);

    // Get.back();
    filePath.value = urlFile.path;
    log(filePath.value ?? "");
    // onResponse(urlFile.path);
    // log(newUrl ?? "");
  }

  Future<void> downloadFile(String url, String path) async {
    final newUrl = "${Get.find<HttpServer>().apiUrl}asset/foto_banner/$url";

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

    if (status.isGranted) {
      try {
        final now = DateTime.now();
        final taskId = await FlutterDownloader.enqueue(
          url: newUrl,
          savedDir: path,
          // fileName: "${model.} $now",
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
        SnackbarUtils.errorSnackbar(text: status.isGranted.toString()),
      );
    }
  }
}
