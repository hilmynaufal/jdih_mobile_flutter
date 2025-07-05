import 'package:jdih_mobile_flutter/models/artikel_model.dart';

class Constant {
  // static const API_URL = "https://ppid.bandungkab.go.id/";
  static const IMAGE_ARTIKEL_URL = "https://ppid.bandungkab.go.id/image/post/";
  static const ARTIKEL_FILTER_FIELD = "a.id_mode";
  static int RESULT_CODE_FOR_BACK_ACTIITY = 1;
  static String JENIS_INFORMASI_FILTER_FIELD = "a.id_category";
  static String JENIS_DOKUMEN_FILTER_FIELD = "a.id_tag";
  static String JENIS_PPID_FILTER_FIELD = "a.id_type";
  static String INSTANSI_FILTER_FIELD = "a.id_department";
  static String JENIS_INFORMASI_CATEGORY_ID = "4";
  static String JENIS_DOKUMEN_CATEGORY_ID = "5";
  static String JENIS_PPID_CATEGORY_ID = "6";
  static String ARTIKEL_BERITA_CATEGORY_SUB_ID_ = "39";
  static String ARTIKEL_KEGIATAN_CATEGORY_SUB_ID_ = "40";
  static String DOKUMEN_TERBARU_ORDER_FIELD = "a.created_date";
  static String TERBANYAK_DILIHAT_ORDER_FIELD = "a.views";
  static String TERBANYAK_DIDOWNLOAD_ORDER_FIELD = "a.download";
  static String JENIS_INFORMASI_STATISTIK_CODE = "jenis_informasi";
  static String JENIS_DOKUMEN_STATISTIK_CODE = "jenis_dokumen";
  static String JENIS_PPID_STATISTIK_CODE = "jenis_ppid";

  static String PERMOHONAN_INFORMASI_SERVICE_ID = "1";
  static String KEBERATAN_INFORMASI_SERVICE_ID = "2";

  static final visiMisiStatic = ArtikelModel(
    namaArtikel: "Visi dan Misi",
    createdDate: "2019-02-26",
    deskripsiArtikel:
        "Salah satu elemen penting dalam mewujudkan penyelenggaraan negara yang terbuka adalah hak publik untuk memperoleh Informasi sesuai dengan peraturan perundang¬undangan. Hak atas Informasi menjadi sangat penting karena makin terbuka penyelenggaraan negara untuk diawasi publik, penyelenggaraan negara tersebut makin dapat dipertanggungjawabkan. Hak setiap Orang untuk memperoleh Informasi juga relevan untuk meningkatkan kualitas pelibatan masyarakat dalam proses pengambilan keputusan publik. Partisipasi atau pelibatan masyarakat tidak banyak berarti tanpa jaminan keterbukaan Informasi Publik.\nKeberadaan Undang-¬undang tentang Keterbukaan Informasi Publik sangat penting sebagai landasan hukum yang berkaitan dengan (1) hak setiap Orang untuk memperoleh Informasi; (2) kewajiban Badan Publik menyediakan dan melayani permintaan Informasi secara cepat, tepat waktu, biaya ringan/proporsional, dan cara sederhana; (3) pengecualian bersifat ketat dan terbatas; (4) kewajiban Badan Publik untuk membenahi sistem dokumentasi dan pelayanan Informasi.\nSetiap Badan Publik mempunyai kewajiban untuk membuka akses atas Informasi Publik yang berkaitan dengan Badan Publik tersebut untuk masyarakat luas. Lingkup Badan Publik dalam Undang-undang ini meliputi lembaga eksekutif, yudikatif, legislatif, serta penyelenggara negara lainnya yang mendapatkan dana dari Anggaran Pendapatan dan Belanja Negara (APBN)/Anggaran Pendapatan dan Belanja Daerah (APBD) dan mencakup pula organisasi nonpemerintah, baik yang berbadan hukum maupun yang tidak berbadan hukum, seperti lembaga swadaya masyarakat, perkumpulan, serta organisasi lainnya yang mengelola atau menggunakan dana yang sebagian atau seluruhnya bersumber dari APBN/APBD, sumbangan masyarakat, dan/atau luar negeri.",
  );
}
