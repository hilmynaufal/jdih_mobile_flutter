import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';

import '../models/artikel_model.dart';

class ArtikelController {
  final server = Get.find<HttpServer>();
  final beritas = RxList<ArtikelModel>();
  final selectedChoice = 0.obs;
  // final page = 0.obs;
  final isLoading = false.obs;
  var limit = 10;

  Future<void> getBeritas({
    required String filter,
    required String filterField,
  }) async {
    try {
      isLoading.value = true;
      final response = await server.getRequest(
        'api/basic/article/filter?filter=$filter&filter_field=$filterField&limit=$limit',
      );
      final jsonData = jsonDecode(response);

      log("test: ${jsonData.toString()}");

      final responseModel = ResponseModel.fromArtikel(jsonData);

      beritas.value = responseModel.data! as List<ArtikelModel>;
      limit += 10;
    } catch (e) {
      print('Error fetching articles: $e');
    }
    isLoading.value = false;
  }
}
