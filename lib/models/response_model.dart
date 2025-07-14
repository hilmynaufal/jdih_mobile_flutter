import 'package:jdih_mobile_flutter/models/artikel_model.dart';
import 'package:jdih_mobile_flutter/models/category_model.dart';
import 'package:jdih_mobile_flutter/models/desa_model.dart';
import 'package:jdih_mobile_flutter/models/dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/education_model.dart';
import 'package:jdih_mobile_flutter/models/instansi_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/halaman_statis_model.dart';
import 'package:jdih_mobile_flutter/models/kecamatan_model.dart';
import 'package:jdih_mobile_flutter/models/login_model.dart';
import 'package:jdih_mobile_flutter/models/riwayat_layanan_model.dart';
import 'package:jdih_mobile_flutter/models/user_model.dart';
import 'package:jdih_mobile_flutter/models/work_model.dart';

class ResponseModel {
  bool? status;
  String? message;
  String? pageTitle;
  dynamic data;

  ResponseModel({this.status, this.message, this.pageTitle, this.data});

  factory ResponseModel.fromHalamanStatis(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<HalamanStatisModel>.from(
                  json["data"]!.map((x) => HalamanStatisModel.fromMap(x)),
                ),
      );

  factory ResponseModel.fromArtikel(Map<String, dynamic> json) => ResponseModel(
    status: json["status"],
    message: json["message"],
    pageTitle: json["pageTitle"],
    data:
        json["data"] == null
            ? []
            : List<ArtikelModel>.from(
              json["data"]!.map((x) => ArtikelModel.fromMap(x)),
            ),
  );

  factory ResponseModel.fromDokumenDetailModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<DetailDokumenModel>.from(
                  json["data"]!.map((x) => DetailDokumenModel.fromMap(x)),
                ),
      );

  factory ResponseModel.fromCategory(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<CategoryModel>.from(
                  json["data"]!.map((x) => CategoryModel.fromMap(x)),
                ),
      );

  factory ResponseModel.fromDokumen(Map<String, dynamic> json) => ResponseModel(
    status: json["status"],
    message: json["message"],
    pageTitle: json["pageTitle"],
    data:
        json["data"] == null
            ? []
            : List<DokumenModel>.from(
              json["data"]!.map((x) => DokumenModel.fromMap(x)),
            ),
  );

  factory ResponseModel.fromInstansi(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<InstansiModel>.from(
                  json["data"]!.map((x) => InstansiModel.fromJson(x)),
                ),
      );

  factory ResponseModel.fromLoginModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data: json['data'] != null ? LoginModel.fromJson(json['data']) : null,
      );

  factory ResponseModel.fromUserModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
      );

  factory ResponseModel.fromEducationModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<EducationModel>.from(
                  json["data"]!.map((x) => EducationModel.fromJson(x)),
                ),
      );

  factory ResponseModel.fromKecamatanModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<KecamatanModel>.from(
                  json["data"]!.map((x) => KecamatanModel.fromJson(x)),
                ),
      );

  factory ResponseModel.fromDesaModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<DesaModel>.from(
                  json["data"]!.map((x) => DesaModel.fromJson(x)),
                ),
      );

  factory ResponseModel.fromRiwayatLayananModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<RiwayatLayananModel>.from(
                  json["data"]!.map((x) => RiwayatLayananModel.fromJson(x)),
                ),
      );

  factory ResponseModel.fromWorkModel(Map<String, dynamic> json) =>
      ResponseModel(
        status: json["status"],
        message: json["message"],
        pageTitle: json["pageTitle"],
        data:
            json["data"] == null
                ? []
                : List<WorkModel>.from(
                  json["data"]!.map((x) => WorkModel.fromJson(x)),
                ),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "pageTitle": pageTitle,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}
