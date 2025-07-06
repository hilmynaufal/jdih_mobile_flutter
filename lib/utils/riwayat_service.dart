import 'package:hive_flutter/hive_flutter.dart';
import '../models/riwayat_dokumen_model.dart';

class RiwayatService {
  static const String _boxName = 'riwayat_dokumen';
  static const int _maxRiwayat = 100; // Maksimal 100 riwayat

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RiwayatDokumenModelAdapter());
    await Hive.openBox<RiwayatDokumenModel>(_boxName);
  }

  static Box<RiwayatDokumenModel> get _box => Hive.box<RiwayatDokumenModel>(_boxName);

  // Menambahkan dokumen ke riwayat
  static Future<void> tambahRiwayat(RiwayatDokumenModel riwayat) async {
    try {
      // Hapus riwayat lama jika sudah ada dokumen dengan ID yang sama
      await hapusRiwayatById(riwayat.id);
      
      // Tambahkan riwayat baru
      await _box.add(riwayat);
      
      // Batasi jumlah riwayat
      await _batasiJumlahRiwayat();
    } catch (e) {
      print('Error menambah riwayat: $e');
    }
  }

  // Mengambil semua riwayat (diurutkan dari yang terbaru)
  static List<RiwayatDokumenModel> getAllRiwayat() {
    try {
      final riwayat = _box.values.toList();
      riwayat.sort((a, b) => b.tanggalDilihat.compareTo(a.tanggalDilihat));
      return riwayat;
    } catch (e) {
      print('Error mengambil riwayat: $e');
      return [];
    }
  }

  // Menghapus riwayat berdasarkan ID
  static Future<void> hapusRiwayatById(String id) async {
    try {
      final riwayat = _box.values.where((item) => item.id == id).toList();
      for (var item in riwayat) {
        await item.delete();
      }
    } catch (e) {
      print('Error menghapus riwayat: $e');
    }
  }

  // Menghapus semua riwayat
  static Future<void> hapusSemuaRiwayat() async {
    try {
      await _box.clear();
    } catch (e) {
      print('Error menghapus semua riwayat: $e');
    }
  }

  // Membatasi jumlah riwayat
  static Future<void> _batasiJumlahRiwayat() async {
    try {
      final riwayat = getAllRiwayat();
      if (riwayat.length > _maxRiwayat) {
        final riwayatBerlebih = riwayat.sublist(_maxRiwayat);
        for (var item in riwayatBerlebih) {
          await item.delete();
        }
      }
    } catch (e) {
      print('Error membatasi jumlah riwayat: $e');
    }
  }

  // Mengecek apakah dokumen sudah ada di riwayat
  static bool isDokumenDiRiwayat(String id) {
    try {
      return _box.values.any((item) => item.id == id);
    } catch (e) {
      print('Error mengecek riwayat: $e');
      return false;
    }
  }

  // Mengambil jumlah riwayat
  static int getJumlahRiwayat() {
    try {
      return _box.length;
    } catch (e) {
      print('Error mengambil jumlah riwayat: $e');
      return 0;
    }
  }
} 