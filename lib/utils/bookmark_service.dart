import 'package:hive_flutter/hive_flutter.dart';
import '../models/bookmark_dokumen_model.dart';

class BookmarkService {
  static const String _boxName = 'bookmark_dokumen';

  static Future<void> initialize() async {
    Hive.registerAdapter(BookmarkDokumenModelAdapter());
    await Hive.openBox<BookmarkDokumenModel>(_boxName);
  }

  static Box<BookmarkDokumenModel> get _box => Hive.box<BookmarkDokumenModel>(_boxName);

  // Menambahkan dokumen ke bookmark
  static Future<void> tambahBookmark(BookmarkDokumenModel bookmark) async {
    try {
      // Hapus bookmark lama jika sudah ada dokumen dengan ID yang sama
      await hapusBookmarkById(bookmark.id ?? "");
      // Tambahkan bookmark baru
      await _box.add(bookmark);
    } catch (e) {
      print('Error menambah bookmark: $e');
    }
  }

  // Mengambil semua bookmark (diurutkan dari yang terbaru)
  static List<BookmarkDokumenModel> getAllBookmark() {
    try {
      final bookmark = _box.values.toList();
      bookmark.sort((a, b) => b.tanggalDibookmark.compareTo(a.tanggalDibookmark));
      return bookmark;
    } catch (e) {
      print('Error mengambil bookmark: $e');
      return [];
    }
  }

  // Menghapus bookmark berdasarkan ID
  static Future<void> hapusBookmarkById(String id) async {
    try {
      final bookmark = _box.values.where((item) => item.id == id).toList();
      for (var item in bookmark) {
        await item.delete();
      }
    } catch (e) {
      print('Error menghapus bookmark: $e');
    }
  }

  // Menghapus semua bookmark
  static Future<void> hapusSemuaBookmark() async {
    try {
      await _box.clear();
    } catch (e) {
      print('Error menghapus semua bookmark: $e');
    }
  }

  // Mengecek apakah dokumen sudah ada di bookmark
  static bool isDokumenDibookmark(String id) {
    try {
      return _box.values.any((item) => item.id == id);
    } catch (e) {
      print('Error mengecek bookmark: $e');
      return false;
    }
  }

  // Mengambil jumlah bookmark
  static int getJumlahBookmark() {
    try {
      return _box.length;
    } catch (e) {
      print('Error mengambil jumlah bookmark: $e');
      return 0;
    }
  }
}
