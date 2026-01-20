import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/models/riwayat_layanan_model.dart';

import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';

class LayananController extends GetxController {
  final server = Get.find<HttpServer>();
  final layanan = RxList<RiwayatLayananModel>();
  // final categories = RxList<CategoryModel>();
  // final stat = RxList<dynamic>();
  // final selectedCategory = Rxn<CategoryModel>();
  var limit = 10;
  final isLoading = false.obs;

  // Future<void> getCategory(
  //     {required String categoryId,
  //     required String filterField,
  //     required String jenisStat}) async {
  //   isLoading.value = true;
  //   final response = await server.getRequest('api/basic/master/category');
  //   final jsonData = jsonDecode(response);

  //   List<CategoryModel> categoryList;
  //   if (response.isEmpty) {
  //     categoryList = Dummy.getCategoryModelDummy();
  //   } else {
  //     categoryList =
  //         (ResponseModel.fromCategory(jsonData).data) as List<CategoryModel>;
  //   }

  //   final filteredList = categoryList.where(
  //     (element) => element.categoryId == categoryId,
  //   );

  //   categories.value = filteredList.toList();

  //   selectedCategory.value = categories.first;

  //   // log(categories.length.toString());

  //   //
  //   await getListDokumen(
  //       filter: selectedCategory.value!.idCategorySub!,
  //       filterField: filterField);
  //   await getStat(jenisStat: jenisStat);
  // }

  // Future<void> getStat({required String jenisStat}) async {
  //   final response = await server.getRequest('api/basic/master/statistik');

  //   final Map<String, dynamic> jsonData = jsonDecode(response);

  //   // log(jenisStat);

  //   // Map<String, String> stat;
  //   if (response.isEmpty) {
  //     stat.value = Dummy.getStatModel()[jenisStat] ?? [];
  //   } else {
  //     // log(jsonData['data'][jenisStat].toString());
  //     stat.value = jsonData['data'][jenisStat] as List<dynamic>;
  //   }

  //   // stat.value = statModel;
  // }

  Future<void> getListRiwayatLayanan() async {
    isLoading.value = true;
    // final dialog = Get.dialog(
    //   AlertDialog(
    //     content: Container(
    //       height: 60,
    //       width: 60,
    //       child: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     ),
    //     insetPadding: EdgeInsets.symmetric(horizontal: 100),
    //   ),
    // );

    final userId = Get.find<SharedPrefs>().idUser.value;

    // log(userId ?? "");

    final bodyMap = <String, String>{
      "keyword": userId ?? "",
      "limit": "10",
      "start": "0",
    };

    final response = await server.postMultiPart(
      'api/v2/layanan/mpp_queue/search',
      bodyMap,
    );

    final jsonData = jsonDecode(response);

    log(response);

    final responseModel = ResponseModel.fromRiwayatLayananModel(jsonData);

    layanan.value = responseModel.data! as List<RiwayatLayananModel>;
    limit += 10;

    // Get.back();
    isLoading.value = false;
  }
}
