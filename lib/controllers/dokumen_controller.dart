import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/category_model.dart';
import 'package:jdih_mobile_flutter/models/dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/halaman_statis_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/kategori_dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/utils/dummy.dart';

class DokumenController extends GetxController {
  final server = Get.find<HttpServer>();
  final artikels = RxList<DokumenModel>();
  final categories = RxList<CategoryModel>();
  final stat = RxList<dynamic>();
  final selectedCategory = Rxn<CategoryModel>();
  var limit = 10;
  final isLoading = false.obs;

  //jdih
  final test = RxList<DetailDokumenModel>();
  final kategori = RxList<KategoriDokumenModel>();
  final halamanStatis = RxList<HalamanStatisModel>();

  //cari
  final selectedCariCategory = "".obs;

  Future<void> getTestJdih(
    String keyword,
    String kategori,
    String tahun,
    String no,
  ) async {
    isLoading.value = true;
    final response = await server.getRequest(
      'api/Tampil_hukum/search?keyword=$keyword&tahun=$tahun&kategori=$kategori&nomor=$no',
    );

    log("keyword: $keyword");
    log("tahun: $tahun");
    log("kategori: $kategori");
    log("no: $no");
    final jsonData = jsonDecode(response);

    List<DetailDokumenModel> categoryList;
    if (response.isEmpty) {
      categoryList = [];
    } else {
      categoryList =
          (ResponseModel.fromDokumenDetailModel(jsonData).data)
              as List<DetailDokumenModel>;
    }

    test.value = categoryList;
    // log(test.length.toString());
    isLoading.value = false;
  }

  Future<void> getHalamanStatis() async {
    isLoading.value = true;
    final response = await server.getRequest('api/Tampil_hukum/halamanstatis');
    final jsonData = jsonDecode(response);

    List<HalamanStatisModel> halamanStatisList;
    if (response.isEmpty) {
      halamanStatisList = [];
    } else {
      halamanStatisList =
          (ResponseModel.fromHalamanStatis(jsonData).data)
              as List<HalamanStatisModel>;
    }

    // Tidak ada variabel untuk menyimpan data halaman statis, jadi tidak ada yang diupdate.
    // Jika diperlukan, tambah variabel untuk menyimpan data ini dan update nilai seperti di bawah ini:
    halamanStatis.value = halamanStatisList;

    isLoading.value = false;
  }

  Future<void> getJdihKategori() async {
    isLoading.value = true;

    // Fetch both endpoints concurrently
    // log("getJdihKategori");
    final responses = await Future.wait([
      server.getRequest('api/Tampil_hukum/rekapjdih'),
      server.getRequest('api/Tampil_hukum/kategorihukum'),
    ]);

    final rekapResponse = responses[0];
    final kategoriResponse = responses[1];

    final rekapJson = jsonDecode(rekapResponse);
    final kategoriJson = jsonDecode(kategoriResponse);

    List<KategoriDokumenModel> rekapList = [];
    if (rekapResponse.isNotEmpty) {
      rekapList = List<KategoriDokumenModel>.from(
        rekapJson.map((x) => KategoriDokumenModel.fromMap(x)),
      );
    }

    // log(rekapList.toString());

    List<dynamic> kategoriData = [];
    // log(kategoriJson.toString());
    // log(kategoriResponse.toString());
    if (kategoriResponse.isNotEmpty) {
      kategoriData = kategoriJson;
    }

    // Create a map for quick lookup of jenis_id by jenis_keterangan from kategoriData
    // Assuming 'jenis_keterangan' is the common key as per request
    final Map<String, String> idMap = {};
    for (var item in kategoriData) {
      if (item['jenis_keterangan'] != null) {
        idMap[item['jenis_keterangan']] = item['jenis_id'].toString();
      }
    }

    // Merge data: Update rekapList items with jenis_id from idMap
    final mergedList =
        rekapList.map((item) {
          final id = idMap[item.jenisKeterangan] ?? item.jenisId;
          return KategoriDokumenModel(
            jenisId: id,
            jenisNama: item.jenisNama,
            jenisLevel: item.jenisLevel,
            jenisKeterangan: item.jenisKeterangan,
            jml: item.jml,
          );
        }).toList();

    // log(mergedList.toString());
    kategori.value = mergedList;
    isLoading.value = false;
  }

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
      (element) => element.categoryId == categoryId,
    );

    categories.value = filteredList.toList();

    selectedCategory.value = categories.first;

    // log(categories.length.toString());

    //
    await getListDokumen(
      filter: selectedCategory.value!.idCategorySub!,
      filterField: filterField,
    );
    await getStat(jenisStat: jenisStat);
  }

  Future<void> getStat({required String jenisStat}) async {
    final response = await server.getRequest('api/basic/master/statistik');

    final Map<String, dynamic> jsonData = jsonDecode(response);

    // log(jenisStat);

    // Map<String, String> stat;
    if (response.isEmpty) {
      stat.value = Dummy.getStatModel()[jenisStat] ?? [];
    } else {
      // log(jsonData['data'][jenisStat].toString());
      stat.value = jsonData['data'][jenisStat] as List<dynamic>;
    }

    // stat.value = statModel;
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
          child: Center(child: CircularProgressIndicator()),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 100),
      ),
    );
    try {
      final response = await server.getRequest(
        'api/basic/documents/filter?filter=$filter&filter_field=$filterField&limit=$limit',
      );
      final jsonData = jsonDecode(response);

      final responseModel = ResponseModel.fromDokumen(jsonData);
      // log(responseModel.toMap().toString());

      artikels.value = responseModel.data! as List<DokumenModel>;
      limit += 10;
    } catch (e) {
      print('Error fetching articles: $e');
    }
    Get.back();
    isLoading.value = false;
  }
}
