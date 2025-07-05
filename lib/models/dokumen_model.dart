class DokumenModel {
  String? idDokumen;
  String? idDepartment;
  String? idJenisPpid;
  String? idJenisDokumen;
  String? idJenisInformasi;
  String? namaInstansi;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  String? updateDate;
  dynamic totalDilihat;
  String? terakhirDilihat;
  dynamic totalDidownload;
  dynamic terakhirDidownload;
  String? namaDokumen;
  String? deskripsiDokumen;
  String? keywordsDokumen;
  String? urlDokumen;
  String? fileDokumen;
  String? previewDokumen;
  String? jenisDokumen;
  String? jenisPpid;
  String? jenisInformasi;
  String? tahunDokumen;
  String? formatDokumen;
  String? ukuranDokumen;

  DokumenModel({
    this.idDokumen,
    this.idDepartment,
    this.idJenisPpid,
    this.idJenisDokumen,
    this.idJenisInformasi,
    this.namaInstansi,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updateDate,
    this.totalDilihat,
    this.terakhirDilihat,
    this.totalDidownload,
    this.terakhirDidownload,
    this.namaDokumen,
    this.deskripsiDokumen,
    this.keywordsDokumen,
    this.urlDokumen,
    this.fileDokumen,
    this.previewDokumen,
    this.jenisDokumen,
    this.jenisPpid,
    this.jenisInformasi,
    this.tahunDokumen,
    this.formatDokumen,
    this.ukuranDokumen,
  });

  factory DokumenModel.fromMap(Map<String, dynamic> json) => DokumenModel(
        idDokumen: json["id_dokumen"],
        idDepartment: json["id_department"],
        idJenisPpid: json["id_jenis_ppid"],
        idJenisDokumen: json["id_jenis_dokumen"],
        idJenisInformasi: json["id_jenis_informasi"],
        namaInstansi: json["nama_instansi"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
        updatedBy: json["updated_by"],
        updateDate: json["update_date"],
        totalDilihat: json["total_dilihat"],
        terakhirDilihat: json["terakhir_dilihat"],
        totalDidownload: json["total_didownload"],
        terakhirDidownload: json["terakhir_didownload"],
        namaDokumen: json["nama_dokumen"],
        deskripsiDokumen: json["deskripsi_dokumen"],
        keywordsDokumen: json["keywords_dokumen"],
        urlDokumen: json["url_dokumen"],
        fileDokumen: json["file_dokumen"],
        previewDokumen: json["preview_dokumen"],
        jenisDokumen: json["jenis_dokumen"],
        jenisPpid: json["jenis_ppid"],
        jenisInformasi: json["jenis_informasi"],
        tahunDokumen: json["tahun_dokumen"],
        formatDokumen: json["format_dokumen"],
        ukuranDokumen: json["ukuran_dokumen"],
      );

  Map<String, dynamic> toMap() => {
        "id_dokumen": idDokumen,
        "id_department": idDepartment,
        "id_jenis_ppid": idJenisPpid,
        "id_jenis_dokumen": idJenisDokumen,
        "id_jenis_informasi": idJenisInformasi,
        "nama_instansi": namaInstansi,
        "created_by": createdBy,
        "created_date": createdDate,
        "updated_by": updatedBy,
        "update_date": updateDate,
        "total_dilihat": totalDilihat,
        "terakhir_dilihat": terakhirDilihat,
        "total_didownload": totalDidownload,
        "terakhir_didownload": terakhirDidownload,
        "nama_dokumen": namaDokumen,
        "deskripsi_dokumen": deskripsiDokumen,
        "keywords_dokumen": keywordsDokumen,
        "url_dokumen": urlDokumen,
        "file_dokumen": fileDokumen,
        "preview_dokumen": previewDokumen,
        "jenis_dokumen": jenisDokumen,
        "jenis_ppid": jenisPpid,
        "jenis_informasi": jenisInformasi,
        "tahun_dokumen": tahunDokumen,
        "format_dokumen": formatDokumen,
        "ukuran_dokumen": ukuranDokumen,
      };
}
