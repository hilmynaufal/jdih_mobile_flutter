import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/controllers/login_controller.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/desa_model.dart';
import 'package:jdih_mobile_flutter/models/education_model.dart';

import 'package:jdih_mobile_flutter/models/kecamatan_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/models/user_model.dart';
import 'package:jdih_mobile_flutter/models/work_model.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

class ProfileController extends GetxController {
  final server = Get.find<HttpServer>();

  final educations = RxList<EducationModel>();
  final works = RxList<WorkModel>();
  final kecamatans = RxList<KecamatanModel>();
  final desas = RxList<DesaModel>();

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

    if (educations.isEmpty) {
      getEducationsList();
    }

    if (works.isEmpty) {
      getWorkList();
    }

    if (kecamatans.isEmpty) {
      getKecamatanList();
    }
  }

  Future<void> getEducationsList() async {
    try {
      isLoading.value = true;
      final response = await server.getRequest(
        'api/v2/layanan/disdukcasip_ref_education/index',
      );
      final jsonData = jsonDecode(response);

      final responseModel = ResponseModel.fromEducationModel(jsonData);
      // log(responseModel.toMap().toString());

      educations.value = responseModel.data as List<EducationModel>;
    } catch (e) {
      print('Error fetching education: $e');
    }
    isLoading.value = false;
  }

  Future<void> getWorkList() async {
    try {
      isLoading.value = true;
      final response = await server.getRequest(
        'api/v2/layanan/disdukcasip_ref_job/index',
      );
      final jsonData = jsonDecode(response);

      final responseModel = ResponseModel.fromWorkModel(jsonData);
      // log(responseModel.toMap().toString());

      works.value = responseModel.data as List<WorkModel>;
    } catch (e) {
      print('Error fetching education: $e');
    }
    isLoading.value = false;
  }

  Future<void> getKecamatanList() async {
    try {
      isLoading.value = true;
      final response = await server.postMultiPart(
        'api/v2/layanan/administrative_districts/search',
        <String, String>{"keyword": "3204"},
      );
      final jsonData = jsonDecode(response);

      final responseModel = ResponseModel.fromKecamatanModel(jsonData);
      // log("test: ${responseModel.toMap().toString()}");

      kecamatans.value = responseModel.data as List<KecamatanModel>;

      final userKecamatanId =
          Get.find<SharedPrefs>().modelUser.value?.districtId;
      await getDesaList(kecamatanId: userKecamatanId ?? "");
    } catch (e) {
      print('Error fetching kecamatan: $e');
    }
    isLoading.value = false;
  }

  Future<void> getDesaList({required String kecamatanId}) async {
    try {
      isLoading.value = true;
      // log(kecamatanId);
      final response = await server.postMultiPart(
        'api/v2/layanan/administrative_villages/search',
        {"keyword": kecamatanId},
      );
      final jsonData = jsonDecode(response);

      final responseModel = ResponseModel.fromDesaModel(jsonData);
      // log(responseModel.toMap().toString());

      desas.value = responseModel.data as List<DesaModel>;
    } catch (e) {
      print('Error fetching desa: $e');
    }
    isLoading.value = false;
  }

  Future<void> editProfile({required void Function() onSuccess}) async {
    if (tempUser.value == null) {
      Get.showSnackbar(
        SnackbarUtils.errorSnackbar(text: "Menunggu Loading Data..."),
      );
      return;
    }

    final user = Get.find<SharedPrefs>().modelUser.value ?? UserModel();

    //TODO: ubah
    // var response =
    //     await server.postMultiPart('api/v2/layanan/user/edit', <String, String>{
    //   "id_user": user.idUser ?? "",
    //   "code": user.code ?? "",
    //   "family_code": user.familyCode ?? "",
    //   "fullname": user.fullname ?? "",
    //   "gender": user.gender ?? "",
    //   "birth": user.birth ?? "",
    //   "phone": user.phone ?? "",
    //   "email": user.email ?? "",
    //   "username": user.username ?? "",
    //   "description": user.description ?? "",
    //   "image": user.image ?? "",
    //   "password": user.password ?? "",
    //   "province_id": user.provinceId ?? "",
    //   "regency_id": user.regencyId ?? "",
    //   "district_id": user.districtId ?? "",
    //   "village_id": user.villageId ?? "",
    //   "rt_id": user.rtId ?? "",
    //   "rw_id": user.rwId ?? "",
    //   // "education_id": selectedEducation.value != null
    //   //     ? selectedEducation.value?.idEducation ?? ""
    //   //     : (user.educationId ?? ""),
    //   // "work_id": selectedWork.value != null
    //   //     ? selectedWork.value?.idJob ?? ""
    //   //     : (user.educationId ?? ""),
    //   "work_name": user.workName ?? "",
    //   "work_division": user.workDivision ?? "",
    // });

    final bodyMap = <String, String>{};

    //TODO: testing log with early return
    final userModelMap = tempUser.value?.toMap() ?? {};

    for (var key in userModelMap.keys) {
      final value = userModelMap[key];
      if (value != null) {
        bodyMap[key] = value;
      }
    }

    log(bodyMap.toString());

    // return;

    var response = await server.postMultiPart(
      'api/v2/layanan/user/edit',
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
