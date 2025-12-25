import 'package:get/get.dart';
import '../models/bookmark_dokumen_model.dart';
import '../models/jdih_models/detail_dokumen_model.dart';
import '../utils/bookmark_service.dart';

class BookmarkController extends GetxController {
  final RxList<BookmarkDokumenModel> bookmarkList = <BookmarkDokumenModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmark();
  }

  // Memuat bookmark dari Hive
  Future<void> loadBookmark() async {
    isLoading.value = true;
    try {
      final bookmark = BookmarkService.getAllBookmark();
      bookmarkList.assignAll(bookmark);
    } catch (e) {
      print('Error memuat bookmark: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Menambahkan dokumen ke bookmark dari DetailDokumenModel
  Future<void> tambahBookmarkFromDetail(DetailDokumenModel detail) async {
    try {
      final bookmark = BookmarkDokumenModel.fromDetail(detail, DateTime.now());
      await BookmarkService.tambahBookmark(bookmark);
      await loadBookmark(); // Reload bookmark setelah menambah
    } catch (e) {
      print('Error menambah bookmark: $e');
    }
  }

  // Toggle bookmark (tambah jika belum ada, hapus jika sudah ada)
  Future<void> toggleBookmark(DetailDokumenModel detail) async {
    try {
      if (isDokumenDibookmark(detail.id ?? "")) {
        await hapusBookmark(detail.id ?? "");
      } else {
        await tambahBookmarkFromDetail(detail);
      }
    } catch (e) {
      print('Error toggle bookmark: $e');
    }
  }

  // Menghapus bookmark berdasarkan ID
  Future<void> hapusBookmark(String id) async {
    try {
      await BookmarkService.hapusBookmarkById(id);
      await loadBookmark(); // Reload bookmark setelah menghapus
    } catch (e) {
      print('Error menghapus bookmark: $e');
    }
  }

  // Menghapus semua bookmark
  Future<void> hapusSemuaBookmark() async {
    try {
      await BookmarkService.hapusSemuaBookmark();
      await loadBookmark(); // Reload bookmark setelah menghapus
    } catch (e) {
      print('Error menghapus semua bookmark: $e');
    }
  }

  // Mengecek apakah dokumen sudah ada di bookmark
  bool isDokumenDibookmark(String id) {
    // Menggunakan bookmarkList reactive agar Obx() bisa observe perubahan
    return bookmarkList.any((item) => item.id == id);
  }

  // Mengambil jumlah bookmark
  int getJumlahBookmark() {
    return BookmarkService.getJumlahBookmark();
  }
}
