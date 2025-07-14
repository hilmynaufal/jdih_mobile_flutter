class HalamanStatisModel {
  String? idHalaman;
  String? judul;
  String? isiHalaman;
  String? tglPosting;
  String? gambar;

  HalamanStatisModel({
    this.idHalaman,
    this.judul,
    this.isiHalaman,
    this.tglPosting,
    this.gambar,
  });

  factory HalamanStatisModel.fromMap(Map<String, dynamic> map) {
    return HalamanStatisModel(
      idHalaman: map["id_halaman"],
      judul: map["judul"],
      isiHalaman: map["isi_halaman"],
      tglPosting: map["tgl_posting"],
      gambar: map["gambar"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id_halaman": idHalaman,
      "judul": judul,
      "isi_halaman": isiHalaman,
      "tgl_posting": tglPosting,
      "gambar": gambar,
    };
  }
}
