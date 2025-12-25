import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/views/artikel_page.dart';
import 'package:jdih_mobile_flutter/views/berita_page.dart';
import 'package:jdih_mobile_flutter/views/bookmark_page.dart';
import 'package:jdih_mobile_flutter/views/cari_dokumen_page.dart';
import 'package:jdih_mobile_flutter/views/coming_soon_page.dart';
import 'package:jdih_mobile_flutter/views/home_page.dart';
import 'package:jdih_mobile_flutter/views/profile_screen.dart';
import 'package:jdih_mobile_flutter/views/riwayat_layanan_page.dart';
import 'package:jdih_mobile_flutter/views/riwayat_page.dart';

class BottomNavController extends GetxController {
  final selectedIndex = 0.obs;
  final bodyWidget = [
    HomePage(),
    // ArtikelPage(),
    BeritaPage(),
    CariDokumenPage(title: "Cari Dokumen"),
    BookmarkPage(title: "Bookmark"),
    RiwayatPage(title: "Riwayat Dokumen"),
  ];

  final bottomNavItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.article),
      label: 'Artikel',
      backgroundColor: Colors.white,
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.file_copy),
      label: 'Cari',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Bookmark',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Riwayat',
      backgroundColor: Colors.white,
    ),
  ];
}
