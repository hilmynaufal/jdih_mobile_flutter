import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/response_model.dart';
import 'package:jdih_mobile_flutter/models/login_model.dart';
import 'package:jdih_mobile_flutter/models/user_model.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

class LoginController extends GetxController {
  final usernameTec = TextEditingController();
  final server = Get.find<HttpServer>();
  final passwordTec = TextEditingController();
  final user = Rxn<LoginModel>();

  void cekUsernameTerisi({
    required void Function() onSuccess,
    required void Function() onNotFound,
  }) {
    if (usernameTec.text.isEmpty) {
      Get.showSnackbar(
        SnackbarUtils.errorSnackbar(text: "Username tidak boleh kosong"),
      );
      return;
    }

    cekUsername(
      username: usernameTec.text,
      onSuccess: onSuccess,
      onNotFound: onNotFound,
    );

    // getUser(
    //     username: usernameTec.value.text,
    //     onSuccess: onSuccess,
    //     onNotFound: onNotFound);
  }

  //return id of user if exist / null if not exist
  Future<void> getUser({
    required void Function(UserModel) onSuccess,
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
        user.value = responseModel.data as LoginModel;
        // onSuccess();
        getDetailUser(idUser: user.value?.idUser ?? "", onSuccess: onSuccess);
        // return user.value!.idUser ?? "";
      }
    }
  }

  Future<void> cekUsername({
    required String username,
    required void Function() onSuccess,
    required void Function() onNotFound,
  }) async {
    log(username);
    var response = await server.postMultiPart(
      'api/v2/layanan/user/checkusername',
      <String, String>{
        "username": username,
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
      // return null;
    } else {
      final responseModel = ResponseModel.fromLoginModel(jsonData);
      if (responseModel.status == "failed") {
        onNotFound();
        // Get.showSnackbar(
        //     SnackbarUtils.errorSnackbar(text: responseModel.message ?? ""));
      } else {
        // user.value = responseModel.data as LoginModel;
        onSuccess();
        // getDetailUser(idUser: user.value?.idUser ?? "", onSuccess: onSuccess);
      }
    }
  }

  Future<void> getDetailUser({
    required String idUser,
    required void Function(UserModel usermodel) onSuccess,
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
        onSuccess(userModel);
      }
    }
  }
}
