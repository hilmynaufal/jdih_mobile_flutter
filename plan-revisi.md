# beberapa revisi

## Perbaikan fitur widget hukum populer dan terbaru
karena di response list kedua tersebut tidak didapatkan detail hukum yang bisa digunakan di detail dokumen page, maka saat kita melakukan klik dari widget tersebut, kita akan mengambil id, lalu mendapat data nya dari
endpoint: https://jdihdprd.bandungkab.go.id/api/Tampil_hukum/detail/{{ id }}
contoh response: 
{
    "status": true,
    "message": "Detail dokumen hukum",
    "data": [
        {
            "id": "1059",
            "id_jenis": "10",
            "id_status": "6",
            "nama": "Perubahan Atas Peraturan Daerah Nomor 10 Tahun 2023 tentang Pajak Daerah dan Retribusi Daerah",
            "nama_inggris": "",
            "no": "9",
            "tahun": "2025",
            "tanggal_ditetapkan": "2025-07-28",
            "tanggal_diundangkan": "2025-07-28",
            "katalog": "",
            "abstrak": null,
            "penganti": null,
            "jumlah_unduh": "0",
            "dibaca": "15",
            "didownload": "19",
            "visible": "1",
            "sumber": "LD (2025) : 9.",
            "subjek": "PAJAK DAERAH, RETRIBUSI DAERAH",
            "status_peraturan": "",
            "bahasa": "Indonesia",
            "lokasi": "",
            "bidang_hukum": "",
            "kode_lampiran": "",
            "tempat_penetapan": "Soreang",
            "tentang": "",
            "jenis_dokumen": "1",
            "created_at": "2025-09-30 02:52:58",
            "created_by": null,
            "updated_at": null,
            "updated_by": null,
            "status_nama": "Baru",
            "jenis_id": "10",
            "jenis_nama": "Peraturan Daerah",
            "jenis_keterangan": "PERDA",
            "path_file_abstrak": null,
            "path_file_inggris": null,
            "path_peraturan": "/asset/file_hukum/No_9_Tahun_2025__68db460ab5bb91.42410802.pdf",
            "dokumen_id": "1",
            "nama_dokumen": "Peraturan Perundang-Undangan",
            "judul": "Peraturan Daerah  No 9 Tahun 2025 Tentang Perubahan Atas Peraturan Daerah Nomor 10 Tahun 2023 tentang Pajak Daerah dan Retribusi Daerah"
        }
    ],
    "total": 1
}

agar data yang dibutuhkan di detail dokumen page bisa kita dapatkan dan bisa di tampilkan