import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/category_model.dart';
import 'package:jdih_mobile_flutter/models/dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/instansi_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/utils/dummy.dart';

class DetailInstansiController extends GetxController {
  final server = Get.find<HttpServer>();
  final instansis = RxList<InstansiModel>();
  final categories = RxList<CategoryModel>();

  final selectedCategory = Rxn<CategoryModel>();
  final selectedCategoryStat = Rxn<String>();

  final dokumens = RxList<DokumenModel>();

  final filteredDokumens = RxList<DokumenModel>();

  final selectedChoice = 0.obs;
  final stat = RxList<Map<String, String>>();
  var limit = 10;
  final isLoading = false.obs;

  // Future<void> getInstansiList() async {
  //   try {
  //     final response = await server.getRequest('api/basic/master/department');
  //     final jsonData = jsonDecode(response);

  //     final responseModel = ResponseModel.fromInstansi(jsonData);
  //     // log(responseModel.toMap().toString());

  //     instansis.value = responseModel.data! as List<InstansiModel>;
  //   } catch (e) {
  //     print('Error fetching instansi: $e');
  //   }
  // }

  Future<void> getCategory({
    required String categoryId,
    required String filterField,
    required String jenisStat,
  }) async {
    isLoading.value = true;
    final response = await server.getRequest('api/basic/master/category');
    final jsonData = jsonDecode(response);

    List<CategoryModel> categoryList;
    if (response.isEmpty) {
      categoryList = Dummy.getCategoryModelDummy();
    } else {
      categoryList =
          (ResponseModel.fromCategory(jsonData).data) as List<CategoryModel>;
    }

    final filteredList = categoryList.where(
      (element) => element.categoryId == Constant.JENIS_DOKUMEN_CATEGORY_ID,
    );

    categories.value = filteredList.toList();

    selectedCategory.value = categories.first;

    await getListDokumen(filter: categoryId, filterField: filterField);
  }

  Future<void> getListDokumen({
    required String filter,
    required String filterField,
  }) async {
    isLoading.value = true;
    Get.dialog(
      AlertDialog(
        content: Container(
          height: 60,
          width: 60,
          child: const Center(child: CircularProgressIndicator()),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 100),
      ),
    );
    try {
      final response = await server.getRequest(
        'api/basic/documents/filter?filter=$filter&filter_field=$filterField&limit=$limit',
      );
      final jsonData = jsonDecode(response);

      final responseModel = ResponseModel.fromDokumen(jsonData);
      // log(responseModel.toMap().toString());

      dokumens.value = responseModel.data! as List<DokumenModel>;
      limit += 10;

      //hitung stat setelah dokumen ada
      getStat();

      //filter dokumen
      filterDokumen();
    } catch (e) {
      print('Error fetching document: $e');
    }
    Get.back();
    isLoading.value = false;
  }

  void filterDokumen() {
    filteredDokumens.value =
        dokumens
            .where(
              (p0) =>
                  p0.idJenisDokumen ==
                  (selectedCategory.value?.idCategorySub ?? ""),
            )
            .toList();
  }

  Future<void> getStat() async {
    final category = categories.where(
      (element) => element.categoryId == Constant.JENIS_DOKUMEN_CATEGORY_ID,
    );

    List<Map<String, String>> tempList = [];

    for (var c in category) {
      var total =
          dokumens.where((p0) => p0.idJenisDokumen == c.idCategorySub).length;

      final map = {"name": c.name ?? "", "total": total.toString()};

      tempList.add(map);
    }

    stat.addAll(tempList);
    selectedCategoryStat.value = stat[0]["total"];
  }
}
