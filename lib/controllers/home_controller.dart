import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/artikel_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final server = Get.find<HttpServer>();
  final beritaTerbaru = RxList<ArtikelModel>();
  final isMenuExpanded = false.obs;
  final isKategoriMenuExpanded = false.obs;

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.ease,
  );

  Future<void> getListBeritaTerbaru() async {
    try {
      final response = await server.getRequest(
        'api/basic/article/filter?filter=39&filter_field=a.id_mode&limit=5',
      );
      final jsonData = jsonDecode(response);

      // log("message ${response.toString()}");

      final responseModel = ResponseModel.fromArtikel(jsonData);
      // log(responseModel.toMap().toString());

      beritaTerbaru.value = responseModel.data! as List<ArtikelModel>;
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }
}
