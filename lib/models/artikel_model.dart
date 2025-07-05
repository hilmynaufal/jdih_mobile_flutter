class ArtikelModel {
  String? idArtikel;
  String? idDepartment;
  String? idJenisPpid;
  String? idJenisArtikel;
  String? idJenisInformasi;
  String? namaInstansi;
  String? createdBy;
  String? createdDate;
  dynamic updatedBy;
  String? updateDate;
  String? totalDilihat;
  String? terakhirDilihat;
  String? namaArtikel;
  String? deskripsiArtikel;
  String? keywordsArtikel;
  String? urlArtikel;
  String? imageArticle;
  String? jenisArtikel;
  String? jenisPpid;
  String? jenisInformasi;
  String? tahunArtikel;
  String? formatArtikel;
  String? ukuranArtikel;

  ArtikelModel({
    this.idArtikel,
    this.idDepartment,
    this.idJenisPpid,
    this.idJenisArtikel,
    this.idJenisInformasi,
    this.namaInstansi,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updateDate,
    this.totalDilihat,
    this.terakhirDilihat,
    this.namaArtikel,
    this.deskripsiArtikel,
    this.keywordsArtikel,
    this.urlArtikel,
    this.imageArticle,
    this.jenisArtikel,
    this.jenisPpid,
    this.jenisInformasi,
    this.tahunArtikel,
    this.formatArtikel,
    this.ukuranArtikel,
  });

  factory ArtikelModel.fromMap(Map<String, dynamic> json) => ArtikelModel(
        idArtikel: json["id_artikel"],
        idDepartment: json["id_department"],
        idJenisPpid: json["id_jenis_ppid"],
        idJenisArtikel: json["id_jenis_artikel"],
        idJenisInformasi: json["id_jenis_informasi"],
        namaInstansi: json["nama_instansi"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
        updatedBy: json["updated_by"],
        updateDate: json["update_date"],
        totalDilihat: json["total_dilihat"],
        terakhirDilihat: json["terakhir_dilihat"],
        namaArtikel: json["nama_artikel"],
        deskripsiArtikel: json["deskripsi_artikel"],
        keywordsArtikel: json["keywords_artikel"],
        urlArtikel: json["url_artikel"],
        imageArticle: json["image_article"],
        jenisArtikel: json["jenis_artikel"],
        jenisPpid: json["jenis_ppid"],
        jenisInformasi: json["jenis_informasi"],
        tahunArtikel: json["tahun_artikel"],
        formatArtikel: json["format_artikel"],
        ukuranArtikel: json["ukuran_artikel"],
      );

  Map<String, dynamic> toMap() => {
        "id_artikel": idArtikel,
        "id_department": idDepartment,
        "id_jenis_ppid": idJenisPpid,
        "id_jenis_artikel": idJenisArtikel,
        "id_jenis_informasi": idJenisInformasi,
        "nama_instansi": namaInstansi,
        "created_by": createdBy,
        "created_date": createdDate,
        "updated_by": updatedBy,
        "update_date": updateDate,
        "total_dilihat": totalDilihat,
        "terakhir_dilihat": terakhirDilihat,
        "nama_artikel": namaArtikel,
        "deskripsi_artikel": deskripsiArtikel,
        "keywords_artikel": keywordsArtikel,
        "url_artikel": urlArtikel,
        "image_article": imageArticle,
        "jenis_artikel": jenisArtikel,
        "jenis_ppid": jenisPpid,
        "jenis_informasi": jenisInformasi,
        "tahun_artikel": tahunArtikel,
        "format_artikel": formatArtikel,
        "ukuran_artikel": ukuranArtikel,
      };
}
