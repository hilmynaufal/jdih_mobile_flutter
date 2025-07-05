class DetailDokumenModel {
  String? id;
  String? idJenis;
  String? idStatus;
  String? nama;
  String? namaInggris;
  String? no;
  String? tahun;
  String? tanggalDitetapkan;
  String? tanggalDiundangkan;
  String? katalog;
  String? abstrak;
  String? penganti;
  String? jumlahUnduh;
  String? dibaca;
  String? didownload;
  String? visible;
  String? sumber;
  String? subjek;
  String? statusPeraturan;
  String? bahasa;
  String? lokasi;
  String? bidangHukum;
  String? kodeLampiran;
  String? tempatPenetapan;
  String? tentang;
  String? jenisDokumen;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? statusNama;
  String? jenisId;
  String? jenisNama;
  String? jenisKeterangan;
  String? pathFileAbstrak;
  String? pathFileInggris;
  String? pathPeraturan;
  String? dokumenId;
  String? namaDokumen;
  String? judul;

  DetailDokumenModel({
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
  });

  factory DetailDokumenModel.fromMap(Map<String, dynamic> json) {
    return DetailDokumenModel(
      id: json["id"],
      idJenis: json["id_jenis"],
      idStatus: json["id_status"],
      nama: json["nama"],
      namaInggris: json["nama_inggris"],
      no: json["no"],
      tahun: json["tahun"],
      tanggalDitetapkan: json["tanggal_ditetapkan"],
      tanggalDiundangkan: json["tanggal_diundangkan"],
      katalog: json["katalog"],
      abstrak: json["abstrak"],
      penganti: json["penganti"],
      jumlahUnduh: json["jumlah_unduh"],
      dibaca: json["dibaca"],
      didownload: json["didownload"],
      visible: json["visible"],
      sumber: json["sumber"],
      subjek: json["subjek"],
      statusPeraturan: json["status_peraturan"],
      bahasa: json["bahasa"],
      lokasi: json["lokasi"],
      bidangHukum: json["bidang_hukum"],
      kodeLampiran: json["kode_lampiran"],
      tempatPenetapan: json["tempat_penetapan"],
      tentang: json["tentang"],
      jenisDokumen: json["jenis_dokumen"],
      createdAt: json["created_at"],
      createdBy: json["created_by"],
      updatedAt: json["updated_at"],
      updatedBy: json["updated_by"],
      statusNama: json["status_nama"],
      jenisId: json["jenis_id"],
      jenisNama: json["jenis_nama"],
      jenisKeterangan: json["jenis_keterangan"],
      pathFileAbstrak: json["path_file_abstrak"],
      pathFileInggris: json["path_file_inggris"],
      pathPeraturan: json["path_peraturan"],
      dokumenId: json["dokumen_id"],
      namaDokumen: json["nama_dokumen"],
      judul: json["judul"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "id_jenis": idJenis,
      "id_status": idStatus,
      "nama": nama,
      "nama_inggris": namaInggris,
      "no": no,
      "tahun": tahun,
      "tanggal_ditetapkan": tanggalDitetapkan,
      "tanggal_diundangkan": tanggalDiundangkan,
      "katalog": katalog,
      "abstrak": abstrak,
      "penganti": penganti,
      "jumlah_unduh": jumlahUnduh,
      "dibaca": dibaca,
      "didownload": didownload,
      "visible": visible,
      "sumber": sumber,
      "subjek": subjek,
      "status_peraturan": statusPeraturan,
      "bahasa": bahasa,
      "lokasi": lokasi,
      "bidang_hukum": bidangHukum,
      "kode_lampiran": kodeLampiran,
      "tempat_penetapan": tempatPenetapan,
      "tentang": tentang,
      "jenis_dokumen": jenisDokumen,
      "created_at": createdAt,
      "created_by": createdBy,
      "updated_at": updatedAt,
      "updated_by": updatedBy,
      "status_nama": statusNama,
      "jenis_id": jenisId,
      "jenis_nama": jenisNama,
      "jenis_keterangan": jenisKeterangan,
      "path_file_abstrak": pathFileAbstrak,
      "path_file_inggris": pathFileInggris,
      "path_peraturan": pathPeraturan,
      "dokumen_id": dokumenId,
      "nama_dokumen": namaDokumen,
      "judul": judul,
    };
  }
}
