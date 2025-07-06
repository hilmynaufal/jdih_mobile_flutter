import 'package:hive/hive.dart';

part 'riwayat_dokumen_model.g.dart';

@HiveType(typeId: 0)
class RiwayatDokumenModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String judul;

  @HiveField(2)
  String nomor;

  @HiveField(3)
  String tahun;

  @HiveField(4)
  String? fileUrl;

  @HiveField(5)
  DateTime tanggalDilihat;

  @HiveField(6)
  String? kategori;

  @HiveField(7)
  String? instansi;

  RiwayatDokumenModel({
    required this.id,
    required this.judul,
    required this.nomor,
    required this.tahun,
    this.fileUrl,
    required this.tanggalDilihat,
    this.kategori,
    this.instansi,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'nomor': nomor,
      'tahun': tahun,
      'fileUrl': fileUrl,
      'tanggalDilihat': tanggalDilihat.toIso8601String(),
      'kategori': kategori,
      'instansi': instansi,
    };
  }

  factory RiwayatDokumenModel.fromJson(Map<String, dynamic> json) {
    return RiwayatDokumenModel(
      id: json['id'],
      judul: json['judul'],
      nomor: json['nomor'],
      tahun: json['tahun'],
      fileUrl: json['fileUrl'],
      tanggalDilihat: DateTime.parse(json['tanggalDilihat']),
      kategori: json['kategori'],
      instansi: json['instansi'],
    );
  }
} 