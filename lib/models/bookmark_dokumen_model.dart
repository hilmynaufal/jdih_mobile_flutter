import 'package:hive/hive.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';

part 'bookmark_dokumen_model.g.dart';

@HiveType(typeId: 1)
class BookmarkDokumenModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? idJenis;
  @HiveField(2)
  String? idStatus;
  @HiveField(3)
  String? nama;
  @HiveField(4)
  String? namaInggris;
  @HiveField(5)
  String? no;
  @HiveField(6)
  String? tahun;
  @HiveField(7)
  String? tanggalDitetapkan;
  @HiveField(8)
  String? tanggalDiundangkan;
  @HiveField(9)
  String? katalog;
  @HiveField(10)
  String? abstrak;
  @HiveField(11)
  String? penganti;
  @HiveField(12)
  String? jumlahUnduh;
  @HiveField(13)
  String? dibaca;
  @HiveField(14)
  String? didownload;
  @HiveField(15)
  String? visible;
  @HiveField(16)
  String? sumber;
  @HiveField(17)
  String? subjek;
  @HiveField(18)
  String? statusPeraturan;
  @HiveField(19)
  String? bahasa;
  @HiveField(20)
  String? lokasi;
  @HiveField(21)
  String? bidangHukum;
  @HiveField(22)
  String? kodeLampiran;
  @HiveField(23)
  String? tempatPenetapan;
  @HiveField(24)
  String? tentang;
  @HiveField(25)
  String? jenisDokumen;
  @HiveField(26)
  String? createdAt;
  @HiveField(27)
  String? createdBy;
  @HiveField(28)
  String? updatedAt;
  @HiveField(29)
  String? updatedBy;
  @HiveField(30)
  String? statusNama;
  @HiveField(31)
  String? jenisId;
  @HiveField(32)
  String? jenisNama;
  @HiveField(33)
  String? jenisKeterangan;
  @HiveField(34)
  String? pathFileAbstrak;
  @HiveField(35)
  String? pathFileInggris;
  @HiveField(36)
  String? pathPeraturan;
  @HiveField(37)
  String? dokumenId;
  @HiveField(38)
  String? namaDokumen;
  @HiveField(39)
  String? judul;
  @HiveField(40)
  DateTime tanggalDibookmark;

  BookmarkDokumenModel({
    this.id,
    this.idJenis,
    this.idStatus,
    this.nama,
    this.namaInggris,
    this.no,
    this.tahun,
    this.tanggalDitetapkan,
    this.tanggalDiundangkan,
    this.katalog,
    this.abstrak,
    this.penganti,
    this.jumlahUnduh,
    this.dibaca,
    this.didownload,
    this.visible,
    this.sumber,
    this.subjek,
    this.statusPeraturan,
    this.bahasa,
    this.lokasi,
    this.bidangHukum,
    this.kodeLampiran,
    this.tempatPenetapan,
    this.tentang,
    this.jenisDokumen,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.statusNama,
    this.jenisId,
    this.jenisNama,
    this.jenisKeterangan,
    this.pathFileAbstrak,
    this.pathFileInggris,
    this.pathPeraturan,
    this.dokumenId,
    this.namaDokumen,
    this.judul,
    required this.tanggalDibookmark,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idJenis': idJenis,
      'idStatus': idStatus,
      'nama': nama,
      'namaInggris': namaInggris,
      'no': no,
      'tahun': tahun,
      'tanggalDitetapkan': tanggalDitetapkan,
      'tanggalDiundangkan': tanggalDiundangkan,
      'katalog': katalog,
      'abstrak': abstrak,
      'penganti': penganti,
      'jumlahUnduh': jumlahUnduh,
      'dibaca': dibaca,
      'didownload': didownload,
      'visible': visible,
      'sumber': sumber,
      'subjek': subjek,
      'statusPeraturan': statusPeraturan,
      'bahasa': bahasa,
      'lokasi': lokasi,
      'bidangHukum': bidangHukum,
      'kodeLampiran': kodeLampiran,
      'tempatPenetapan': tempatPenetapan,
      'tentang': tentang,
      'jenisDokumen': jenisDokumen,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'updatedAt': updatedAt,
      'updatedBy': updatedBy,
      'statusNama': statusNama,
      'jenisId': jenisId,
      'jenisNama': jenisNama,
      'jenisKeterangan': jenisKeterangan,
      'pathFileAbstrak': pathFileAbstrak,
      'pathFileInggris': pathFileInggris,
      'pathPeraturan': pathPeraturan,
      'dokumenId': dokumenId,
      'namaDokumen': namaDokumen,
      'judul': judul,
      'tanggalDibookmark': tanggalDibookmark.toIso8601String(),
    };
  }

  factory BookmarkDokumenModel.fromJson(Map<String, dynamic> json) {
    return BookmarkDokumenModel(
      id: json['id'],
      idJenis: json['idJenis'],
      idStatus: json['idStatus'],
      nama: json['nama'],
      namaInggris: json['namaInggris'],
      no: json['no'],
      tahun: json['tahun'],
      tanggalDitetapkan: json['tanggalDitetapkan'],
      tanggalDiundangkan: json['tanggalDiundangkan'],
      katalog: json['katalog'],
      abstrak: json['abstrak'],
      penganti: json['penganti'],
      jumlahUnduh: json['jumlahUnduh'],
      dibaca: json['dibaca'],
      didownload: json['didownload'],
      visible: json['visible'],
      sumber: json['sumber'],
      subjek: json['subjek'],
      statusPeraturan: json['statusPeraturan'],
      bahasa: json['bahasa'],
      lokasi: json['lokasi'],
      bidangHukum: json['bidangHukum'],
      kodeLampiran: json['kodeLampiran'],
      tempatPenetapan: json['tempatPenetapan'],
      tentang: json['tentang'],
      jenisDokumen: json['jenisDokumen'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      updatedAt: json['updatedAt'],
      updatedBy: json['updatedBy'],
      statusNama: json['statusNama'],
      jenisId: json['jenisId'],
      jenisNama: json['jenisNama'],
      jenisKeterangan: json['jenisKeterangan'],
      pathFileAbstrak: json['pathFileAbstrak'],
      pathFileInggris: json['pathFileInggris'],
      pathPeraturan: json['pathPeraturan'],
      dokumenId: json['dokumenId'],
      namaDokumen: json['namaDokumen'],
      judul: json['judul'],
      tanggalDibookmark: DateTime.parse(json['tanggalDibookmark']),
    );
  }

  factory BookmarkDokumenModel.fromDetail(DetailDokumenModel detail, DateTime tanggalDibookmark) {
    return BookmarkDokumenModel(
      id: detail.id,
      idJenis: detail.idJenis,
      idStatus: detail.idStatus,
      nama: detail.nama,
      namaInggris: detail.namaInggris,
      no: detail.no,
      tahun: detail.tahun,
      tanggalDitetapkan: detail.tanggalDitetapkan,
      tanggalDiundangkan: detail.tanggalDiundangkan,
      katalog: detail.katalog,
      abstrak: detail.abstrak,
      penganti: detail.penganti,
      jumlahUnduh: detail.jumlahUnduh,
      dibaca: detail.dibaca,
      didownload: detail.didownload,
      visible: detail.visible,
      sumber: detail.sumber,
      subjek: detail.subjek,
      statusPeraturan: detail.statusPeraturan,
      bahasa: detail.bahasa,
      lokasi: detail.lokasi,
      bidangHukum: detail.bidangHukum,
      kodeLampiran: detail.kodeLampiran,
      tempatPenetapan: detail.tempatPenetapan,
      tentang: detail.tentang,
      jenisDokumen: detail.jenisDokumen,
      createdAt: detail.createdAt,
      createdBy: detail.createdBy,
      updatedAt: detail.updatedAt,
      updatedBy: detail.updatedBy,
      statusNama: detail.statusNama,
      jenisId: detail.jenisId,
      jenisNama: detail.jenisNama,
      jenisKeterangan: detail.jenisKeterangan,
      pathFileAbstrak: detail.pathFileAbstrak,
      pathFileInggris: detail.pathFileInggris,
      pathPeraturan: detail.pathPeraturan,
      dokumenId: detail.dokumenId,
      namaDokumen: detail.namaDokumen,
      judul: detail.judul,
      tanggalDibookmark: tanggalDibookmark,
    );
  }
}
