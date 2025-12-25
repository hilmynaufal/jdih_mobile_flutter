import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../models/offline_dokumen_model.dart';
import '../models/jdih_models/detail_dokumen_model.dart';

class OfflineService {
  static const String _boxName = 'offline_dokumen';
  static const String _offlineFolder = 'offline_documents';

  static Future<void> initialize() async {
    Hive.registerAdapter(OfflineDokumenModelAdapter());
    await Hive.openBox<OfflineDokumenModel>(_boxName);
  }

  static Box<OfflineDokumenModel> get _box =>
      Hive.box<OfflineDokumenModel>(_boxName);

  // Download file dan simpan offline
  static Future<String?> simpanDokumenOffline({
    required DetailDokumenModel dokumen,
    required String fileUrl,
    Function(double)? onProgress,
  }) async {
    try {
      // Download file
      final localPath = await _downloadFileToLocal(
        fileUrl: fileUrl,
        fileName: '${dokumen.id}_${dokumen.namaDokumen}.pdf',
        onProgress: onProgress,
      );

      if (localPath == null) return null;

      // Get file size
      final file = File(localPath);
      final fileSize = await file.length();

      // Simpan metadata ke Hive
      final offlineDokumen = OfflineDokumenModel.fromDetail(
        detail: dokumen,
        tanggalDisimpan: DateTime.now(),
        localFilePath: localPath,
        fileSize: fileSize,
      );

      // Hapus dokumen lama jika sudah ada dengan ID yang sama
      await hapusDokumenOfflineById(dokumen.id ?? "");

      // Tambahkan dokumen offline baru
      await _box.add(offlineDokumen);

      return localPath;
    } catch (e) {
      print('Error simpan dokumen offline: $e');
      return null;
    }
  }

  // Download file ke local storage
  static Future<String?> _downloadFileToLocal({
    required String fileUrl,
    required String fileName,
    Function(double)? onProgress,
  }) async {
    try {
      // Get app documents directory
      final appDir = await getApplicationDocumentsDirectory();
      final offlineDir = Directory('${appDir.path}/$_offlineFolder');

      // Buat folder jika belum ada
      if (!await offlineDir.exists()) {
        await offlineDir.create(recursive: true);
      }

      final filePath = '${offlineDir.path}/$fileName';

      // Download file dengan progress tracking
      final request = await http.Client().send(http.Request('GET', Uri.parse(fileUrl)));
      final totalBytes = request.contentLength ?? 0;
      var downloadedBytes = 0;

      final file = File(filePath);
      final sink = file.openWrite();

      await for (var chunk in request.stream) {
        sink.add(chunk);
        downloadedBytes += chunk.length;

        // Report progress
        if (onProgress != null && totalBytes > 0) {
          onProgress(downloadedBytes / totalBytes);
        }
      }

      await sink.close();
      return filePath;
    } catch (e) {
      print('Error download file: $e');
      return null;
    }
  }

  // Mengambil dokumen offline berdasarkan ID
  static OfflineDokumenModel? getDokumenOffline(String id) {
    try {
      return _box.values.firstWhere(
        (item) => item.id == id,
        orElse: () => throw Exception('Not found'),
      );
    } catch (e) {
      return null;
    }
  }

  // Mengambil semua dokumen offline (diurutkan dari yang terbaru)
  static List<OfflineDokumenModel> getAllDokumenOffline() {
    try {
      final offline = _box.values.toList();
      offline.sort((a, b) => b.tanggalDisimpan.compareTo(a.tanggalDisimpan));
      return offline;
    } catch (e) {
      print('Error mengambil dokumen offline: $e');
      return [];
    }
  }

  // Menghapus dokumen offline berdasarkan ID
  static Future<void> hapusDokumenOfflineById(String id) async {
    try {
      final offline = _box.values.where((item) => item.id == id).toList();
      for (var item in offline) {
        // Hapus file local
        await _deleteLocalFile(item.localFilePath);
        // Hapus dari Hive
        await item.delete();
      }
    } catch (e) {
      print('Error menghapus dokumen offline: $e');
    }
  }

  // Menghapus semua dokumen offline
  static Future<void> hapusSemuaDokumenOffline() async {
    try {
      // Hapus semua file local
      for (var item in _box.values) {
        await _deleteLocalFile(item.localFilePath);
      }
      // Clear Hive box
      await _box.clear();
    } catch (e) {
      print('Error menghapus semua dokumen offline: $e');
    }
  }

  // Delete local file
  static Future<void> _deleteLocalFile(String? filePath) async {
    try {
      if (filePath != null) {
        final file = File(filePath);
        if (await file.exists()) {
          await file.delete();
        }
      }
    } catch (e) {
      print('Error menghapus file local: $e');
    }
  }

  // Mengecek apakah dokumen sudah disimpan offline
  static bool isDokumenOffline(String id) {
    try {
      return _box.values.any((item) => item.id == id);
    } catch (e) {
      print('Error mengecek dokumen offline: $e');
      return false;
    }
  }

  // Mengambil jumlah dokumen offline
  static int getJumlahDokumenOffline() {
    try {
      return _box.length;
    } catch (e) {
      print('Error mengambil jumlah dokumen offline: $e');
      return 0;
    }
  }

  // Mengambil total size storage yang digunakan
  static int getTotalSizeOffline() {
    try {
      int totalSize = 0;
      for (var item in _box.values) {
        totalSize += item.fileSize ?? 0;
      }
      return totalSize;
    } catch (e) {
      print('Error mengambil total size: $e');
      return 0;
    }
  }

  // Format file size ke string yang readable
  static String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }
}
