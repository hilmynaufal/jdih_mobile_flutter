import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/login_model.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/models/user_model.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

class DaftarController extends GetxController {
  final server = Get.find<HttpServer>();
  final usernameTec = TextEditingController();
  final nikTec = TextEditingController();
  final emailTec = TextEditingController();
  final noHpTec = TextEditingController();
  final namaLengkapTec = TextEditingController();
  final passwordTec = TextEditingController();

  Future<void> getUser({
    required void Function(String message) onSuccess,
    required void Function(String message) onNotFound,
  }) async {
    if (usernameTec.text.isEmpty ||
        nikTec.text.isEmpty ||
        emailTec.text.isEmpty ||
        noHpTec.text.isEmpty ||
        namaLengkapTec.text.isEmpty ||
        passwordTec.text.isEmpty) {
      Get.showSnackbar(
        SnackbarUtils.errorSnackbar(
          text: "Mohon isi semua form terlebih dahulu!",
        ),
      );
      return;
    }
    // log(username);
    var response = await server.postMultiPart(
      'api/v2/layanan/user/checkusername',
      <String, String>{
        "username": usernameTec.text,
        // "email": "hilmyblaze@gmail.com",
        // "password": "Darkside1masamune"
      },
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
        // onNotFound();
        // Get.showSnackbar(
        //     SnackbarUtils.errorSnackbar(text: responseModel.message ?? ""));
        daftarUser(onSuccess: onSuccess);
      } else {
        // user.value = responseModel.data as LoginModel;
        onNotFound(responseModel.message ?? "");
        // onSuccess();
      }
    }
  }

  Future<void> daftarUser({
    required void Function(String message) onSuccess,
  }) async {
    // log(username);
    final body = <String, String>{
      "code": nikTec.text,
      "fullname": namaLengkapTec.text,
      "email": emailTec.text,
      "phone": noHpTec.text,
      "image": "default.png",
      "password": passwordTec.text,
      "username": usernameTec.text,
      "province_id": "32",
      "regency_id": "3204",
    };
    log(body.toString());
    var response = await server.postMultiPart('api/v2/layanan/user/save', body);

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
      final responseModel = ResponseModel.fromUserModel(jsonData);
      if (responseModel.status == "failed") {
        Get.showSnackbar(
          SnackbarUtils.errorSnackbar(text: responseModel.message ?? ""),
        );
      } else {
        // UserModel userModel = responseModel.data as UserModel;

        // Get.find<SharedPrefs>().login(userModel, userModel.idUser ?? "");

        //login again
        await login(onSuccess: onSuccess, onNotFound: (String error) {});

        // onSuccess(responseModel.message ?? "");

        // Get.showSnackbar(SnackbarUtils.successSnackbar(
        //     title: "Success", text: responseModel.message ?? ""));
      }
    }
  }

  Future<void> login({
    required void Function(String message) onSuccess,
    required void Function(String error) onNotFound,
  }) async {
    // log(username);
    var response = await server.postMultiPart(
      'api/v2/layanan/user/login',
      <String, String>{
        "username": usernameTec.text,
        // "email": "hilmyblaze@gmail.com",
        "password": passwordTec.text,
      },
    );

    // log(response);

    //cek if include error div
    final cek = response.split("</div>");
    if (cek.length > 1) {
      response = cek[1];
    }

    final Map<String, dynamic> jsonData = jsonDecode(response);

    log(jsonData.toString());

    if (response.isEmpty) {
      Get.showSnackbar(SnackbarUtils.errorSnackbar(text: "Error tak terduga"));
      // return null;
    } else {
      final responseModel = ResponseModel.fromLoginModel(jsonData);
      if (responseModel.status == "failed") {
        onNotFound(responseModel.message ?? "");
        // return null;
        // Get.showSnackbar(
        //     SnackbarUtils.errorSnackbar(text: responseModel.message ?? ""));
      } else {
        LoginModel loginModel = responseModel.data as LoginModel;
        // onSuccess();
        getDetailUser(idUser: loginModel.idUser ?? "", onSuccess: onSuccess);
        // return user.value!.idUser ?? "";
      }
    }
  }

  Future<void> getDetailUser({
    required String idUser,
    required void Function(String message) onSuccess,
  }) async {
    // log(username);
    var response = await server.postMultiPart(
      'api/v2/layanan/user/view',
      <String, String>{
        "id_user": idUser,
        // "email": "hilmyblaze@gmail.com",
        // "password": "Darkside1masamune"
      },
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
      final responseModel = ResponseModel.fromUserModel(jsonData);
      if (responseModel.status == "failed") {
        Get.showSnackbar(
          SnackbarUtils.errorSnackbar(text: responseModel.message ?? ""),
        );
      } else {
        UserModel userModel = responseModel.data as UserModel;
        Get.find<SharedPrefs>().login(userModel, userModel.idUser ?? "");
        onSuccess("Anda Berhasil Login");
      }
    }
  }
}
