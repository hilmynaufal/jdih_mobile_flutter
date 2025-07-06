import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/cari_bottomsheet.dart';
import 'package:jdih_mobile_flutter/category_bottomsheet.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/controllers/riwayat_controller.dart';
import 'package:jdih_mobile_flutter/jumlah_widget.dart';
import 'package:jdih_mobile_flutter/login_bottomsheet.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_dokumen_page.dart';
import 'package:jdih_mobile_flutter/views/simple_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/dokumen_card.dart';
import '../components/riwayat_card.dart';
import '../models/riwayat_dokumen_model.dart';
import '../models/jdih_models/detail_dokumen_model.dart';

class RiwayatPage extends StatelessWidget {
  RiwayatPage({super.key, required this.title});

  final controller = Get.find<DokumenController>();
  final riwayatController = Get.find<RiwayatController>();
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
          if (riwayatController.riwayatList.isNotEmpty)
            IconButton(
              onPressed: () => _showClearConfirmation(context),
              icon: Icon(Icons.delete_sweep_outlined),
              tooltip: 'Hapus semua riwayat',
            ),
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
                if (riwayatController.isLoading.value) {
                  return _buildLoadingState();
                }
                
                if (riwayatController.riwayatList.isEmpty) {
                  return _buildEmptyState();
                }
                
                return _buildRiwayatList();
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
            FontAwesomeIcons.history,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Belum ada riwayat',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Riwayat dokumen yang Anda lihat akan muncul di sini',
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

  Widget _buildRiwayatList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: riwayatController.riwayatList.length,
      itemBuilder: (context, index) {
        final riwayat = riwayatController.riwayatList[index];
        return RiwayatCard(
          riwayat: riwayat,
          onTap: () => _onRiwayatTap(riwayat),
          onDelete: () => _onDeleteRiwayat(riwayat.id),
        );
      },
    );
  }

  void _onRiwayatTap(RiwayatDokumenModel riwayat) {
    // Create DetailDokumenModel from riwayat
    final detailDokumen = DetailDokumenModel(
      id: riwayat.id,
      namaDokumen: riwayat.judul,
      no: riwayat.nomor,
      tahun: riwayat.tahun,
      judul: riwayat.judul,
      pathPeraturan: riwayat.fileUrl,
      jenisNama: riwayat.kategori,
      subjek: riwayat.instansi,
    );
    
    // Navigate to detail dokumen page
    Get.to(() => DetailDokumenPage(dokumen: detailDokumen));
  }

  void _onDeleteRiwayat(String id) {
    Get.dialog(
      AlertDialog(
        title: Text('Hapus Riwayat'),
        content: Text('Apakah Anda yakin ingin menghapus dokumen ini dari riwayat?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              riwayatController.hapusRiwayat(id);
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
        title: Text('Hapus Semua Riwayat'),
        content: Text('Apakah Anda yakin ingin menghapus semua riwayat dokumen?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              riwayatController.hapusSemuaRiwayat();
            },
            child: Text('Hapus Semua', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
