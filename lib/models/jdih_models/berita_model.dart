class BeritaModel {
  String? idBerita;
  String? idKategori;
  String? username;
  String? judul;
  String? judulSeo;
  String? headline;
  String? isiBerita;
  String? hari;
  String? tanggal;
  String? jam;
  String? gambar;
  String? dibaca;
  String? tag;

  BeritaModel({
    this.idBerita,
    this.idKategori,
    this.username,
    this.judul,
    this.judulSeo,
    this.headline,
    this.isiBerita,
    this.hari,
    this.tanggal,
    this.jam,
    this.gambar,
    this.dibaca,
    this.tag,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_berita': idBerita,
      'id_kategori': idKategori,
      'username': username,
      'judul': judul,
      'judul_seo': judulSeo,
      'headline': headline,
      'isi_berita': isiBerita,
      'hari': hari,
      'tanggal': tanggal,
      'jam': jam,
      'gambar': gambar,
      'dibaca': dibaca,
      'tag': tag,
    };
  }

  factory BeritaModel.fromMap(Map<String, dynamic> map) {
    return BeritaModel(
      idBerita: map['id_berita'],
      idKategori: map['id_kategori'],
      username: map['username'],
      judul: map['judul'],
      judulSeo: map['judul_seo'],
      headline: map['headline'],
      isiBerita: map['isi_berita'],
      hari: map['hari'],
      tanggal: map['tanggal'],
      jam: map['jam'],
      gambar: map['gambar'],
      dibaca: map['dibaca'],
      tag: map['tag'],
    );
  }
}
