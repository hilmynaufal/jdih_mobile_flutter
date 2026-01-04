# Changelog

All notable changes to the JDIH DPRD Kabupaten Bandung mobile application will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2025-10-17

### Added
- **Statistik Pengunjung Widget**: Widget baru di halaman home yang menampilkan statistik pengunjung dalam real-time
  - Pengunjung Hari Ini
  - Hit Hari Ini
  - Total Pengunjung
  - Waktu update terakhir
  - API endpoint: `api/Tampil_hukum/statistik`

- **Hukum Terbaru Widget**: Horizontal scrollable list menampilkan dokumen hukum terbaru
  - Menampilkan 5 dokumen hukum terbaru
  - Card dengan informasi: nama dokumen, jenis, nomor & tahun, jumlah dibaca, jumlah diunduh
  - Tap untuk melihat detail lengkap dokumen
  - API endpoint: `api/Tampil_hukum/hukum_terbaru`

- **Hukum Populer Widget**: Horizontal scrollable list menampilkan dokumen hukum terpopuler
  - Menampilkan 5 dokumen hukum terpopuler berdasarkan jumlah views
  - Card dengan informasi: nama dokumen, jenis, nomor & tahun, jumlah dibaca, jumlah diunduh
  - Tap untuk melihat detail lengkap dokumen
  - API endpoint: `api/Tampil_hukum/hukum_populer`

- **Fitur Bookmark**: Kemampuan menyimpan dokumen favorit secara lokal
  - Bookmark/unbookmark dokumen dari halaman detail
  - Halaman khusus untuk melihat semua dokumen yang di-bookmark
  - Disimpan menggunakan Hive untuk akses offline
  - Icon bookmark di halaman detail dokumen
  - Notifikasi feedback saat bookmark ditambah/dihapus

- **Fitur Simpan Offline**: Kemampuan menyimpan dokumen untuk akses offline
  - Download dan simpan dokumen secara lokal
  - Akses dokumen tanpa koneksi internet
  - Halaman khusus untuk melihat dokumen offline
  - Disimpan menggunakan Hive database
  - Management storage untuk dokumen offline

### Fixed
- **Menu Struktur Organisasi**: Perbaikan tampilan dan fungsi download
  - Menu struktur organisasi kini dapat ditampilkan dengan benar
  - Fungsi download untuk struktur organisasi sudah berfungsi
  - Dokumen dapat diunduh dan disimpan

### Technical Changes
- Menambahkan model `VisitorStatisticsModel` untuk data statistik pengunjung
- Menambahkan model `BookmarkDokumenModel` dengan Hive integration
- Menambahkan model `OfflineDokumenModel` dengan Hive integration
- Menambahkan `BookmarkController` untuk manajemen bookmark
- Menambahkan `OfflineController` untuk manajemen dokumen offline
- Menambahkan `BookmarkService` untuk operasi Hive bookmark
- Menambahkan `OfflineService` untuk operasi Hive offline storage
- Update `HomeController` dengan method:
  - `getVisitorStatistics()` - fetch statistik pengunjung
  - `getHukumTerbaru()` - fetch dokumen hukum terbaru
  - `getHukumPopuler()` - fetch dokumen hukum populer
  - `getDetailDokumen(String id)` - fetch detail lengkap dokumen
- Menambahkan komponen widget:
  - `VisitorStatisticsWidget` - statistik pengunjung
  - `HukumTerbaruWidget` - list hukum terbaru
  - `HukumPopulerWidget` - list hukum populer
  - `BookmarkCard` - card untuk bookmark item
- Update `DetailDokumenPage` dengan icon bookmark
- Dependency `intl` untuk formatting angka dan tanggal

### Dependencies
- No new dependencies added (intl already existed in pubspec.yaml)

---

## [1.1.0] - Previous Release

### Added
- Initial release with core features
- Document browsing and search
- Article/News listing
- Document history (Riwayat)
- User authentication
- Document categories
- PDF viewer integration

### Known Issues
- Menu struktur organisasi belum dapat ditampilkan dengan benar
- Tidak ada statistik pengunjung
- Tidak ada fitur bookmark
- Tidak ada fitur offline storage

---

## Future Releases

See [TODO.md](./TODO.md) for planned features in upcoming releases.
