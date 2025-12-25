import 'dart:convert';

// import 'package:beladiri_flutter/models/login_result_model.dart';
// import 'package:beladiri_flutter/service/http_service.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/login_model.dart';
import 'package:jdih_mobile_flutter/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends GetxController {
  // final authToken = RxnString();

  // final namaDesa = RxnString();
  // final namaKecamatan = RxnString();
  final idUser = RxnString();
  // final url = RxnString();
  // final urlDesa = RxnString();
  final nama = RxnString();
  // final nik = RxnString();
  // final isLoginSementara = RxnBool();
  final modelUser = Rxn<UserModel>();

  Future<void> login(
    UserModel modelUser,
    String idUser,
    // String url,
    // String urlDesa,
    // String authToken,
    // String namaDesa,
    // String namaKecamantan)
  ) async {
    final editor = await SharedPreferences.getInstance();
    await editor.setString("model_user", jsonEncode(modelUser.toMap()));
    await editor.setString("id_user", idUser);
    // await editor.setString("url", urlDesa);
    // await editor.setString("urlDesa", urlDesa);
    // await editor.setString("auth_token", authToken);
    // await editor.setString("namaDesa", namaDesa);
    // await editor.setString("namaKecamatan", namaKecamantan);
    await editor.setString("nama", modelUser.fullname ?? '');
    // await editor.setString("nik", modelUser.nik ?? '');
    // await editor.setString("nik", "3204170101590096");
    await editor.setBool("isLoginSementara", true);

    this.idUser.value = idUser;
    // this.url.value = url;
    // this.urlDesa.value = urlDesa;
    // this.namaDesa.value = namaDesa;
    // namaKecamatan.value = namaKecamantan;
    nama.value = modelUser.fullname ?? '';
    // nik.value = modelUser.nik ?? '';

    //for model user
    this.modelUser.value = modelUser;

    // this.authToken.value = authToken;

    // isLoginSementara.value = true;
  }

  // Future<void> loginSementara(
  //     // LoginResultModel modelUser,
  //     // String idPend,
  //     String url,
  //     String urlDesa,
  //     // String authToken,
  //     String namaDesa,
  //     String namaKecamantan) async {
  //   final editor = await SharedPreferences.getInstance();
  //   // await editor.setString("model_user", jsonEncode(modelUser.toMap()));
  //   // await editor.setString("id_user", idPend);
  //   await editor.setString("url", urlDesa);
  //   await editor.setString("urlDesa", urlDesa);
  //   // await editor.setString("auth_token", authToken);
  //   await editor.setString("namaDesa", namaDesa);
  //   await editor.setString("namaKecamatan", namaKecamantan);
  //   await editor.setBool("isLoginSementara", true);
  //   // await editor.setString("nama", modelUser.nama ?? '');
  //   // await editor.setString("nik", modelUser.nik ?? '');
  //   // await editor.setString("nik", "3204170101590096");

  //   // this.idPend.value = idPend;
  //   this.url.value = url;
  //   this.urlDesa.value = urlDesa;
  //   this.namaDesa.value = namaDesa;
  //   namaKecamatan.value = namaKecamantan;
  //   isLoginSementara.value = true;
  //   // nama.value = modelUser.nama ?? '';
  //   // nik.value = modelUser.nik ?? '';

  //   //for model user
  //   // this.modelUser.value = modelUser;

  //   // this.authToken.value = authToken;
  // }

  Future<String?> getNik() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("nik");
  }

  Future<bool?> getLoginSementara() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getBool("isLoginSementara");
  }

  Future<String?> getAuthToken() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("auth_token");
  }

  Future<String?> getIdPend() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("id_user");
  }

  Future<String?> getUrl() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("url");
  }

  Future<String?> getNama() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("nama");
  }

  Future<String?> getNamaKecamatan() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("namaKecamatan");
  }

  Future<String?> getNamaDesa() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("namaDesa");
  }

  Future<String?> getModelUser() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getString("model_user");
  }

  Future<void> logout() async {
    final editor = await SharedPreferences.getInstance();
    editor.clear();
    // this.authToken.value = null;
    this.idUser.value = null;
    this.modelUser.value = null;
    // this.url.value = null;
    // this.urlDesa.value = null;
    // this.namaDesa.value = null;
    // this.namaKecamatan.value = null;
    this.nama.value = null;
    // this.isLoginSementara.value = null;
  }
}
