import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/offline_dokumen_model.dart';
import 'package:jdih_mobile_flutter/utils/offline_service.dart';

class OfflineController extends GetxController {
  var offlineList = <OfflineDokumenModel>[].obs;
  var isLoading = false.obs;

  // Map untuk track download progress: {dokumenId: progress}
  var downloadProgress = <String, double>{}.obs;

  // Map untuk track dokumen yang sedang di-download
  var downloadingDokumen = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    ambilSemuaDokumenOffline();
  }

  // Ambil semua dokumen offline
  void ambilSemuaDokumenOffline() {
    try {
      isLoading.value = true;
      offlineList.value = OfflineService.getAllDokumenOffline();
    } catch (e) {
      print('Error mengambil dokumen offline: $e');
      offlineList.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  // Simpan dokumen offline dengan progress tracking
  Future<bool> simpanDokumenOffline({
    required DetailDokumenModel dokumen,
    required String fileUrl,
  }) async {
    final dokumenId = dokumen.id ?? "";

    if (dokumenId.isEmpty) {
      print('Error: Dokumen ID kosong');
      return false;
    }

    try {
      // Set downloading state
      downloadingDokumen[dokumenId] = true;
      downloadProgress[dokumenId] = 0.0;

      // Simpan dengan progress callback
      final result = await OfflineService.simpanDokumenOffline(
        dokumen: dokumen,
        fileUrl: fileUrl,
        onProgress: (progress) {
          // Update progress
          downloadProgress[dokumenId] = progress;
        },
      );

      if (result != null) {
        // Refresh list
        ambilSemuaDokumenOffline();

        // Clear progress
        downloadProgress.remove(dokumenId);
        downloadingDokumen.remove(dokumenId);

        return true;
      } else {
        // Clear progress on failure
        downloadProgress.remove(dokumenId);
        downloadingDokumen.remove(dokumenId);

        return false;
      }
    } catch (e) {
      print('Error simpan dokumen offline: $e');

      // Clear progress on error
      downloadProgress.remove(dokumenId);
      downloadingDokumen.remove(dokumenId);

      return false;
    }
  }

  // Hapus dokumen offline berdasarkan ID
  Future<void> hapusDokumenOffline(String id) async {
    try {
      isLoading.value = true;
      await OfflineService.hapusDokumenOfflineById(id);
      ambilSemuaDokumenOffline();
    } catch (e) {
      print('Error hapus dokumen offline: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Hapus semua dokumen offline
  Future<void> hapusSemuaDokumenOffline() async {
    try {
      isLoading.value = true;
      await OfflineService.hapusSemuaDokumenOffline();
      ambilSemuaDokumenOffline();
    } catch (e) {
      print('Error hapus semua dokumen offline: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Check apakah dokumen sudah disimpan offline
  bool isDokumenOffline(String id) {
    // Menggunakan offlineList reactive agar Obx() bisa observe perubahan
    return offlineList.any((item) => item.id == id);
  }

  // Get jumlah dokumen offline
  int getJumlahDokumenOffline() {
    return OfflineService.getJumlahDokumenOffline();
  }

  // Get total size semua dokumen offline
  int getTotalSizeOffline() {
    return OfflineService.getTotalSizeOffline();
  }

  // Format file size
  String formatFileSize(int bytes) {
    return OfflineService.formatFileSize(bytes);
  }

  // Get download progress untuk dokumen tertentu
  double getDownloadProgress(String dokumenId) {
    return downloadProgress[dokumenId] ?? 0.0;
  }

  // Check apakah dokumen sedang di-download
  bool isDokumenDownloading(String dokumenId) {
    return downloadingDokumen[dokumenId] ?? false;
  }

  // Get dokumen offline by ID
  OfflineDokumenModel? getDokumenOffline(String id) {
    return OfflineService.getDokumenOffline(id);
  }
}
