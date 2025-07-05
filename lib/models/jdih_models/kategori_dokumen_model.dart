class KategoriDokumenModel {
  final String? jenisId;
  final String? jenisNama;
  final String? jenisLevel;
  final String? jenisKeterangan;
  final String? jml;

  KategoriDokumenModel({
    this.jenisId,
    this.jenisNama,
    this.jenisLevel,
    this.jenisKeterangan,
    this.jml,
  });

  factory KategoriDokumenModel.fromMap(Map<String, dynamic> map) {
    return KategoriDokumenModel(
      jenisId: map["jenis_id"],
      jenisNama: map["jenis_nama"],
      jenisLevel: map["jenis_level"],
      jenisKeterangan: map["jenis_keterangan"],
      jml: map["jml"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "jenis_id": jenisId,
      "jenis_nama": jenisNama,
      "jenis_level": jenisLevel,
      "jenis_keterangan": jenisKeterangan,
      "jml": jml,
    };
  }
}
