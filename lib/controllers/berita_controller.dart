import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/berita_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';

class BeritaController {
  final server = Get.find<HttpServer>();
  final beritas = RxList<BeritaModel>();
  final selectedChoice = 0.obs;
  // final page = 0.obs;
  final isLoading = false.obs;
  var limit = 10;

  Future<void> getBeritas() async {
    try {
      isLoading.value = true;
      final response = await server.getRequest('api/Tampil_hukum/berita');
      final jsonData = jsonDecode(response);

      log("test: ${jsonData.toString()}");

      final responseModel = ResponseModel.fromBeritaModel(jsonData);

      beritas.value = responseModel.data! as List<BeritaModel>;
      limit += 10;
    } catch (e) {
      print('Error fetching articles: $e');
    }
    isLoading.value = false;
  }
}
