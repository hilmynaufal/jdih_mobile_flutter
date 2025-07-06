# Fitur Riwayat Dokumen

Fitur ini memungkinkan aplikasi untuk menyimpan dan menampilkan riwayat dokumen yang telah dilihat oleh pengguna menggunakan Hive sebagai database lokal.

## Komponen yang Dibuat

### 1. Model Riwayat Dokumen (`lib/models/riwayat_dokumen_model.dart`)
- Model untuk menyimpan data riwayat dokumen
- Menggunakan anotasi Hive untuk serialisasi
- Berisi informasi: id, judul, nomor, tahun, fileUrl, tanggalDilihat, kategori, instansi

### 2. Service Riwayat (`lib/utils/riwayat_service.dart`)
- Service untuk mengelola operasi CRUD riwayat dokumen
- Menggunakan Hive sebagai database lokal
- Fitur:
  - Menambah riwayat dokumen
  - Mengambil semua riwayat (diurutkan dari yang terbaru)
  - Menghapus riwayat berdasarkan ID
  - Menghapus semua riwayat
  - Membatasi jumlah riwayat (maksimal 100)
  - Mengecek apakah dokumen sudah ada di riwayat

### 3. Controller Riwayat (`lib/controllers/riwayat_controller.dart`)
- Controller untuk mengelola state riwayat dokumen
- Menggunakan GetX untuk state management
- Fitur:
  - Memuat riwayat dari Hive
  - Menambah dokumen ke riwayat
  - Menghapus riwayat
  - Menghapus semua riwayat
  - Mengecek status dokumen di riwayat

### 4. Komponen Riwayat Card (`lib/components/riwayat_card.dart`)
- Widget untuk menampilkan card riwayat dokumen
- Menampilkan informasi: judul, nomor, tahun, kategori, tanggal dilihat
- Memiliki tombol hapus untuk menghapus riwayat

### 5. Halaman Riwayat (`lib/views/riwayat_page.dart`)
- Halaman untuk menampilkan daftar riwayat dokumen
- Fitur:
  - Loading state dengan skeleton
  - Empty state ketika belum ada riwayat
  - List riwayat dengan card
  - Tombol hapus individual dan hapus semua
  - Navigasi ke detail dokumen

## Cara Kerja

### 1. Inisialisasi
- Hive diinisialisasi di `main.dart`
- Controller riwayat ditambahkan ke dependency injection

### 2. Menambah Riwayat
- Ketika user membuka halaman detail dokumen, otomatis ditambahkan ke riwayat
- Method `_tambahKeRiwayat()` dipanggil di `DetailDokumenPage`

### 3. Menampilkan Riwayat
- Halaman riwayat menggunakan `Obx()` untuk reactive UI
- Data diambil dari controller yang terhubung dengan Hive

### 4. Menghapus Riwayat
- User dapat menghapus riwayat individual atau semua riwayat
- Konfirmasi dialog sebelum menghapus

## Dependensi yang Ditambahkan

```yaml
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0

dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.12
```

## Cara Menjalankan

1. Install dependencies:
```bash
flutter packages get
```

2. Generate Hive adapter:
```bash
flutter packages pub run build_runner build
```

3. Jalankan aplikasi:
```bash
flutter run
```

## Fitur Utama

- ✅ Menyimpan riwayat dokumen yang dilihat
- ✅ Menampilkan daftar riwayat dengan UI yang menarik
- ✅ Menghapus riwayat individual
- ✅ Menghapus semua riwayat
- ✅ Batasan jumlah riwayat (maksimal 100)
- ✅ Navigasi ke detail dokumen dari riwayat
- ✅ Loading dan empty state
- ✅ Responsive design

## Struktur Data

```dart
class RiwayatDokumenModel {
  String id;           // ID dokumen
  String judul;        // Judul dokumen
  String nomor;        // Nomor dokumen
  String tahun;        // Tahun dokumen
  String? fileUrl;     // URL file dokumen
  DateTime tanggalDilihat; // Waktu dokumen dilihat
  String? kategori;    // Kategori dokumen
  String? instansi;    // Instansi dokumen
}
```

## Catatan Penting

1. Hive menggunakan database lokal, data akan tersimpan di perangkat
2. Maksimal 100 riwayat untuk menghemat storage
3. Riwayat diurutkan dari yang terbaru
4. Jika dokumen yang sama dilihat lagi, riwayat lama akan dihapus dan diganti dengan yang baru 