import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/artikel_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/models/visitor_statistics_model.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final server = Get.find<HttpServer>();
  final beritaTerbaru = RxList<ArtikelModel>();
  final visitorStatistics = Rxn<VisitorStatisticsModel>();
  final hukumTerbaru = RxList<DetailDokumenModel>();
  final hukumPopuler = RxList<DetailDokumenModel>();
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

  Future<void> getVisitorStatistics() async {
    try {
      final response = await server.getRequest('api/Tampil_hukum/statistik');
      final jsonData = jsonDecode(response);

      if (jsonData['status'] == true && jsonData['data'] != null) {
        visitorStatistics.value =
            VisitorStatisticsModel.fromMap(jsonData['data']);
      }
    } catch (e) {
      print('Error fetching visitor statistics: $e');
    }
  }

  Future<void> getHukumTerbaru() async {
    try {
      final response = await server.getRequest('api/Tampil_hukum/hukum_terbaru');
      final jsonData = jsonDecode(response);

      if (jsonData['status'] == true && jsonData['data'] != null) {
        final List<dynamic> dataList = jsonData['data'];
        hukumTerbaru.value = dataList
            .map((item) => DetailDokumenModel.fromMap(item))
            .toList();
      }
    } catch (e) {
      print('Error fetching hukum terbaru: $e');
    }
  }

  Future<void> getHukumPopuler() async {
    try {
      final response =
          await server.getRequest('api/Tampil_hukum/hukum_populer');
      final jsonData = jsonDecode(response);

      if (jsonData['status'] == true && jsonData['data'] != null) {
        final List<dynamic> dataList = jsonData['data'];
        hukumPopuler.value = dataList
            .map((item) => DetailDokumenModel.fromMap(item))
            .toList();
      }
    } catch (e) {
      print('Error fetching hukum populer: $e');
    }
  }

  Future<DetailDokumenModel?> getDetailDokumen(String id) async {
    try {
      final response =
          await server.getRequest('api/Tampil_hukum/detail/$id');
      final jsonData = jsonDecode(response);

      if (jsonData['status'] == true && jsonData['data'] != null) {
        final List<dynamic> dataList = jsonData['data'];
        if (dataList.isNotEmpty) {
          return DetailDokumenModel.fromMap(dataList[0]);
        }
      }
      return null;
    } catch (e) {
      print('Error fetching detail dokumen: $e');
      return null;
    }
  }
}
