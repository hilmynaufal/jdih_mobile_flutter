// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:jdih_mobile_flutter/controllers/login_controller.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/models/user_model.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

class BuatLayananController extends GetxController {
  final server = Get.find<HttpServer>();

  final String serviceId;

  BuatLayananController({required this.serviceId});

  // final educations = RxList<EducationModel>();
  // final works = RxList<WorkModel>();
  // final kecamatans = RxList<KecamatanModel>();
  // final desas = RxList<DesaModel>();

  final tempUser = Rxn<UserModel>();

  final isLoading = false.obs;

  @override
  onInit() {
    super.onInit();

    Get.find<LoginController>().getDetailUser(
      idUser: Get.find<SharedPrefs>().idUser.value ?? "",
      onSuccess: (userModel) {
        tempUser.value = userModel;
      },
    );
  }

  Future<void> buatPermohonan({required void Function() onSuccess}) async {
    if (tempUser.value == null) {
      Get.showSnackbar(
        SnackbarUtils.errorSnackbar(text: "Menunggu Loading Data..."),
      );
      return;
    }

    final user = Get.find<SharedPrefs>().modelUser.value ?? UserModel();

    final bodyMap = <String, String>{
      "user_id": user.idUser ?? "",
      "service_id": serviceId,
    };

    //TODO: testing log with early return
    log(bodyMap.toString());
    // return;

    var response = await server.postMultiPart(
      'api/v2/layanan/mpp_queue/save',
      bodyMap,
    );

    //cek if include error div
    final cek = response.split("</div>");
    if (cek.length > 1) {
      response = cek[1];
    }

    final Map<String, dynamic> jsonData = jsonDecode(response);

    log(jsonData.toString());

    if (response.isEmpty) {
      Get.showSnackbar(SnackbarUtils.errorSnackbar(text: "Error tak terduga"));
    } else {
      final responseModel = ResponseModel.fromLoginModel(jsonData);
      if (responseModel.status == "failed") {
        Get.showSnackbar(
          SnackbarUtils.errorSnackbar(text: responseModel.message ?? ""),
        );
      } else {
        // user.value = responseModel.data as LoginModel;
        Get.find<LoginController>().getDetailUser(
          idUser: user.idUser ?? "",
          onSuccess: (u) {
            tempUser.value = u;
          },
        );
        onSuccess();
      }
    }
  }
}
