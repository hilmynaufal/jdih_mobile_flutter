import 'package:get/get.dart';
import '../models/riwayat_dokumen_model.dart';
import '../models/jdih_models/detail_dokumen_model.dart';
import '../utils/riwayat_service.dart';

class RiwayatController extends GetxController {
  final RxList<RiwayatDokumenModel> riwayatList = <RiwayatDokumenModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRiwayat();
  }

  // Memuat riwayat dari Hive
  Future<void> loadRiwayat() async {
    isLoading.value = true;
    try {
      final riwayat = RiwayatService.getAllRiwayat();
      riwayatList.assignAll(riwayat);
    } catch (e) {
      print('Error memuat riwayat: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Menambahkan dokumen ke riwayat dari DetailDokumenModel
  Future<void> tambahRiwayatFromDetail(DetailDokumenModel detail) async {
    try {
      final riwayat = RiwayatDokumenModel.fromDetail(detail, DateTime.now());
      await RiwayatService.tambahRiwayat(riwayat);
      await loadRiwayat(); // Reload riwayat setelah menambah
    } catch (e) {
      print('Error menambah riwayat: $e');
    }
  }

  // Menambahkan dokumen ke riwayat (opsional: jika ingin manual field)
  Future<void> tambahRiwayatManual({
    required String id,
    required String judul,
    required String nomor,
    required String tahun,
    String? fileUrl,
    String? kategori,
    String? instansi,
  }) async {
    try {
      final riwayat = RiwayatDokumenModel(
        id: id,
        judul: judul,
        no: nomor,
        tahun: tahun,
        pathPeraturan: fileUrl,
        jenisNama: kategori,
        subjek: instansi,
        tanggalDilihat: DateTime.now(),
      );
      await RiwayatService.tambahRiwayat(riwayat);
      await loadRiwayat(); // Reload riwayat setelah menambah
    } catch (e) {
      print('Error menambah riwayat: $e');
    }
  }

  // Menghapus riwayat berdasarkan ID
  Future<void> hapusRiwayat(String id) async {
    try {
      await RiwayatService.hapusRiwayatById(id);
      await loadRiwayat(); // Reload riwayat setelah menghapus
    } catch (e) {
      print('Error menghapus riwayat: $e');
    }
  }

  // Menghapus semua riwayat
  Future<void> hapusSemuaRiwayat() async {
    try {
      await RiwayatService.hapusSemuaRiwayat();
      await loadRiwayat(); // Reload riwayat setelah menghapus
    } catch (e) {
      print('Error menghapus semua riwayat: $e');
    }
  }

  // Mengecek apakah dokumen sudah ada di riwayat
  bool isDokumenDiRiwayat(String id) {
    return RiwayatService.isDokumenDiRiwayat(id);
  }

  // Mengambil jumlah riwayat
  int getJumlahRiwayat() {
    return RiwayatService.getJumlahRiwayat();
  }
}