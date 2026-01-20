import 'dart:math';

import 'package:jdih_mobile_flutter/models/category_model.dart';

class Dummy {
  static List<CategoryModel> getCategoryModelDummy() {
    final string = [
      {
        "id_category_sub": "16",
        "category_id": "1",
        "name": "Berita",
        "image": null,
        "url": "",
        "status": "1",
      },
      {
        "id_category_sub": "17",
        "category_id": "1",
        "name": "Informasi",
        "image": null,
        "url": "",
        "status": "1",
      },
      {
        "id_category_sub": "18",
        "category_id": "1",
        "name": "Pengumuman",
        "image": null,
        "url": "",
        "status": "1",
      },
      {
        "id_category_sub": "19",
        "category_id": "4",
        "name": "Informasi Berkala",
        "image": null,
        "url": "informasi-berkala",
        "status": "1",
      },
      {
        "id_category_sub": "20",
        "category_id": "4",
        "name": "Informasi Setiap Saat",
        "image": null,
        "url": "informasi-setiapsaat",
        "status": "1",
      },
      {
        "id_category_sub": "21",
        "category_id": "4",
        "name": "Informasi Serta Merta",
        "image": null,
        "url": "informasi-sertamerta",
        "status": "1",
      },
      {
        "id_category_sub": "22",
        "category_id": "5",
        "name": "Profil Badan Publik",
        "image": null,
        "url": "profil-badan-publik",
        "status": "1",
      },
      {
        "id_category_sub": "23",
        "category_id": "5",
        "name": "Program dan Kegiatan",
        "image": null,
        "url": "program-dan-kegiatan",
        "status": "1",
      },
      {
        "id_category_sub": "24",
        "category_id": "5",
        "name": "Informasi Kinerja",
        "image": null,
        "url": "informasi-kinerja",
        "status": "1",
      },
      {
        "id_category_sub": "25",
        "category_id": "5",
        "name": "Laporan Keuangan",
        "image": null,
        "url": "laporan-keuangan",
        "status": "1",
      },
      {
        "id_category_sub": "26",
        "category_id": "5",
        "name": "Laporan dan Prosedur Akses Informasi",
        "image": null,
        "url": "laporan-dan-prosedur-akses",
        "status": "1",
      },
      {
        "id_category_sub": "27",
        "category_id": "5",
        "name": "Pengaduan dan Pelanggaran",
        "image": null,
        "url": "pengaduan-dan-pelanggaran",
        "status": "1",
      },
      {
        "id_category_sub": "28",
        "category_id": "5",
        "name": "Pengadaan Barang dan Jasa",
        "image": null,
        "url": "pengadaan-barang-dan-jasa",
        "status": "1",
      },
      {
        "id_category_sub": "29",
        "category_id": "5",
        "name": "Informasi Darurat",
        "image": null,
        "url": "informasi-darurat",
        "status": "1",
      },
      {
        "id_category_sub": "30",
        "category_id": "5",
        "name": "Hasil Penelitian",
        "image": null,
        "url": "hasil-penelitian",
        "status": "1",
      },
      {
        "id_category_sub": "31",
        "category_id": "5",
        "name": "Regulasi",
        "image": null,
        "url": "regulasi",
        "status": "1",
      },
      {
        "id_category_sub": "32",
        "category_id": "6",
        "name": "PPID Utama",
        "image": null,
        "url": "ppid-utama",
        "status": "1",
      },
      {
        "id_category_sub": "33",
        "category_id": "6",
        "name": "PPID Pembantu",
        "image": null,
        "url": "ppid-pembantu",
        "status": "1",
      },
      {
        "id_category_sub": "34",
        "category_id": "5",
        "name": "Informasi Serta Merta",
        "image": null,
        "url": "wabah-pandemi-covid19",
        "status": "1",
      },
      {
        "id_category_sub": "35",
        "category_id": "3",
        "name": "Sosialisasi",
        "image": null,
        "url": "sosialisasi",
        "status": "1",
      },
      {
        "id_category_sub": "36",
        "category_id": "3",
        "name": "Bimbingan Teknis",
        "image": null,
        "url": "bimbingan-teknis",
        "status": "1",
      },
      {
        "id_category_sub": "37",
        "category_id": "3",
        "name": "Rapat Koordinasi",
        "image": null,
        "url": "rapat-koordinasi",
        "status": "1",
      },
      {
        "id_category_sub": "38",
        "category_id": "3",
        "name": "Forum Group Discussion",
        "image": null,
        "url": "forum-group-discussion",
        "status": "1",
      },
      {
        "id_category_sub": "39",
        "category_id": "7",
        "name": "Posting Artikel",
        "image": null,
        "url": "posting-artikel",
        "status": "1",
      },
      {
        "id_category_sub": "40",
        "category_id": "7",
        "name": "Posting Agenda",
        "image": null,
        "url": "posting-agenda",
        "status": "1",
      },
      {
        "id_category_sub": "41",
        "category_id": "5",
        "name": "Informasi Ketenagakerjaan",
        "image": null,
        "url": null,
        "status": "1",
      },
    ];

    final categoryModels = List.generate(
      string.length,
      (index) => CategoryModel.fromMap(string[index]),
    );

    return categoryModels;
  }

  static Map<String, List<Map<String, String>>> getStatModel() {
    final string = {
      "jenis_informasi": [
        {"name": "Informasi Berkala", "total": "5869"},
        {"name": "Informasi Setiap Saat", "total": "1127"},
        {"name": "Informasi Serta Merta", "total": "711"},
      ],
      "jenis_dokumen": [
        {"name": "Profil Badan Publik", "total": "1073"},
        {"name": "Program dan Kegiatan", "total": "1304"},
        {"name": "Informasi Kinerja", "total": "1218"},
        {"name": "Laporan Keuangan", "total": "1765"},
        {"name": "Laporan dan Prosedur Akses Informasi", "total": "748"},
        {"name": "Pengaduan dan Pelanggaran", "total": "54"},
        {"name": "Pengadaan Barang dan Jasa", "total": "301"},
        {"name": "Informasi Darurat", "total": "109"},
        {"name": "Hasil Penelitian", "total": "78"},
        {"name": "Regulasi", "total": "712"},
        {"name": "Informasi Serta Merta", "total": "335"},
        {"name": "Informasi Ketenagakerjaan", "total": "10"},
      ],
      "jenis_ppid": [
        {"name": "PPID Utama", "total": "497"},
        {"name": "PPID Pembantu", "total": "7208"},
      ],
    };

    return string;
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
