import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/bookmark_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_dokumen_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/bookmark_card.dart';
import '../models/bookmark_dokumen_model.dart';
import '../models/jdih_models/detail_dokumen_model.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key, required this.title});

  final bookmarkController = Get.find<BookmarkController>();
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: [
          Obx(() {
            if (bookmarkController.bookmarkList.isNotEmpty) {
              return IconButton(
                onPressed: () => _showClearConfirmation(context),
                icon: Icon(Icons.delete_sweep_outlined),
                tooltip: 'Hapus semua bookmark',
              );
            }
            return SizedBox.shrink();
          }),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container(height: 2, color: Colors.green)),
              Expanded(child: Container(height: 2, color: Colors.blue)),
              Expanded(child: Container(height: 2, color: Colors.yellow)),
              Expanded(child: Container(height: 2, color: Colors.red)),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                if (bookmarkController.isLoading.value) {
                  return _buildLoadingState();
                }

                if (bookmarkController.bookmarkList.isEmpty) {
                  return _buildEmptyState();
                }

                return _buildBookmarkList();
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('Loading...'),
              subtitle: Text('Loading...'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Belum ada bookmark',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tambahkan dokumen favorit Anda ke bookmark',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: bookmarkController.bookmarkList.length,
      itemBuilder: (context, index) {
        final bookmark = bookmarkController.bookmarkList[index];
        return BookmarkCard(
          bookmark: bookmark,
          onTap: () => _onBookmarkTap(bookmark),
          onDelete: () => _onDeleteBookmark(bookmark.id ?? ""),
        );
      },
    );
  }

  void _onBookmarkTap(BookmarkDokumenModel bookmark) {
    // Create DetailDokumenModel from bookmark
    final detailDokumen = DetailDokumenModel(
      id: bookmark.id,
      idJenis: bookmark.idJenis,
      idStatus: bookmark.idStatus,
      nama: bookmark.nama,
      namaInggris: bookmark.namaInggris,
      no: bookmark.no,
      tahun: bookmark.tahun,
      tanggalDitetapkan: bookmark.tanggalDitetapkan,
      tanggalDiundangkan: bookmark.tanggalDiundangkan,
      katalog: bookmark.katalog,
      abstrak: bookmark.abstrak,
      penganti: bookmark.penganti,
      jumlahUnduh: bookmark.jumlahUnduh,
      dibaca: bookmark.dibaca,
      didownload: bookmark.didownload,
      visible: bookmark.visible,
      sumber: bookmark.sumber,
      subjek: bookmark.subjek,
      statusPeraturan: bookmark.statusPeraturan,
      bahasa: bookmark.bahasa,
      lokasi: bookmark.lokasi,
      bidangHukum: bookmark.bidangHukum,
      kodeLampiran: bookmark.kodeLampiran,
      tempatPenetapan: bookmark.tempatPenetapan,
      tentang: bookmark.tentang,
      jenisDokumen: bookmark.jenisDokumen,
      createdAt: bookmark.createdAt,
      createdBy: bookmark.createdBy,
      updatedAt: bookmark.updatedAt,
      updatedBy: bookmark.updatedBy,
      statusNama: bookmark.statusNama,
      jenisId: bookmark.jenisId,
      jenisNama: bookmark.jenisNama,
      jenisKeterangan: bookmark.jenisKeterangan,
      pathFileAbstrak: bookmark.pathFileAbstrak,
      pathFileInggris: bookmark.pathFileInggris,
      pathPeraturan: bookmark.pathPeraturan,
      dokumenId: bookmark.dokumenId,
      namaDokumen: bookmark.namaDokumen,
      judul: bookmark.judul,
    );

    // Navigate to detail dokumen page
    Get.to(() => DetailDokumenPage(dokumen: detailDokumen));
  }

  void _onDeleteBookmark(String id) {
    Get.dialog(
      AlertDialog(
        title: Text('Hapus Bookmark'),
        content: Text('Apakah Anda yakin ingin menghapus dokumen ini dari bookmark?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              bookmarkController.hapusBookmark(id);
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showClearConfirmation(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Hapus Semua Bookmark'),
        content: Text('Apakah Anda yakin ingin menghapus semua bookmark?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              bookmarkController.hapusSemuaBookmark();
            },
            child: Text('Hapus Semua', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
