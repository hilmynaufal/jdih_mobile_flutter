# TODO - JDIH DPRD Kabupaten Bandung

This file tracks planned features and improvements for upcoming releases.

## Version 1.3.0 (Planned)

### 1. Multi Bahasa / Internationalization
**Priority**: High
**Status**: Not Started

Implementasi dukungan multi-bahasa untuk aplikasi.

**Tasks:**
- [ ] Setup i18n/localization package (flutter_localizations atau easy_localization)
- [ ] Buat file translations untuk bahasa Indonesia dan Inggris
- [ ] Extract semua hardcoded strings ke translation files
- [ ] Implementasi language switcher di settings/profile page
- [ ] Simpan preferensi bahasa user di SharedPreferences
- [ ] Test semua UI dengan kedua bahasa
- [ ] Update dokumentasi API jika ada endpoint multi-bahasa

**Technical Notes:**
- Gunakan `intl` package atau `easy_localization`
- Translation files: `lib/l10n/` atau `assets/translations/`
- Support minimal: Indonesia (id), English (en)

---

### 2. Perbaikan Menu Tess
**Priority**: Medium
**Status**: Not Started

**Tasks:**
- [ ] Identifikasi masalah di menu tess
- [ ] Define requirements untuk menu tess yang benar
- [ ] Implementasi perbaikan
- [ ] Testing

**Notes:**
- Perlu klarifikasi lebih lanjut mengenai "menu tess"
- Tentukan scope perbaikan yang dibutuhkan

---

### 3. Push Notification
**Priority**: High
**Status**: Not Started

Implementasi push notification untuk update dokumen baru, pengumuman, dll.

**Tasks:**
- [ ] Setup Firebase Cloud Messaging (FCM)
- [ ] Konfigurasi Android untuk FCM
- [ ] Implementasi notification handler
- [ ] Buat notification service/controller
- [ ] Implementasi notification categories:
  - [ ] Dokumen hukum baru
  - [ ] Update dokumen penting
  - [ ] Pengumuman resmi
  - [ ] Reminder (jika ada)
- [ ] Implementasi notification settings (enable/disable per category)
- [ ] Handle notification tap untuk navigate ke halaman terkait
- [ ] Implementasi background/terminated state handling
- [ ] Test notification di foreground/background/terminated
- [ ] Setup backend API untuk trigger notifications (koordinasi dengan backend team)

**Dependencies:**
- `firebase_core`
- `firebase_messaging`
- `flutter_local_notifications`

**Technical Notes:**
- FCM untuk cross-platform push notifications
- Local notifications untuk scheduled/custom notifications
- Notification payload harus include navigation data

---

### 4. Form Aspirasi
**Priority**: Medium
**Status**: Not Started

Fitur untuk user mengirim aspirasi/feedback/pengaduan.

**Tasks:**
- [ ] Design UI form aspirasi
- [ ] Implementasi form fields:
  - [ ] Nama (optional/opsional jika sudah login)
  - [ ] Email/No HP
  - [ ] Kategori aspirasi (dropdown)
  - [ ] Subjek
  - [ ] Isi aspirasi (textarea)
  - [ ] Upload attachment (optional)
- [ ] Form validation
- [ ] Implementasi API integration untuk submit aspirasi
- [ ] Implementasi upload file/foto jika diperlukan
- [ ] Success/error feedback
- [ ] Halaman riwayat aspirasi (jika user login)
- [ ] Status tracking aspirasi (pending, diproses, selesai)
- [ ] Push notification untuk update status aspirasi

**API Requirements:**
- POST endpoint untuk submit aspirasi
- GET endpoint untuk list aspirasi user (jika login)
- Upload endpoint untuk attachment

**Technical Notes:**
- Gunakan `image_picker` untuk foto
- Gunakan `file_picker` untuk dokumen
- Validasi file size dan type
- Anonymous submission atau require login?

---

### 5. Chatbot / FAQ
**Priority**: Medium
**Status**: Not Started

Implementasi chatbot atau FAQ untuk membantu user mendapatkan informasi.

**Approach Options:**
- **Option A**: Rule-based FAQ dengan search
- **Option B**: AI Chatbot integration (Dialogflow, etc.)
- **Option C**: Hybrid (FAQ + Chatbot)

**Tasks:**
- [ ] Tentukan approach (FAQ static vs AI chatbot)
- [ ] Kumpulkan frequently asked questions
- [ ] Design UI chat interface
- [ ] Implementasi FAQ database/content
- [ ] Implementasi search functionality di FAQ
- [ ] (If chatbot) Setup chatbot service (Dialogflow/Rasa/Custom)
- [ ] Implementasi chat UI dengan message bubbles
- [ ] Handle user input dan bot responses
- [ ] Implementasi quick reply buttons
- [ ] Category-based FAQ navigation
- [ ] Link to relevant documents/pages
- [ ] Feedback mechanism (helpful/not helpful)

**Dependencies (if AI chatbot):**
- `dialogflow_flutter` atau custom API integration
- Chat UI package atau custom implementation

**Content Requirements:**
- List of FAQs dari team DPRD
- Kategori FAQ (umum, dokumen, layanan, dll)
- Standard responses

---

### 6. Lokasi dengan Peta
**Priority**: Low
**Status**: Not Started

Menampilkan lokasi kantor DPRD Kabupaten Bandung di peta.

**Tasks:**
- [ ] Setup Google Maps API key
- [ ] Implementasi Google Maps integration
- [ ] Halaman lokasi dengan map view
- [ ] Marker untuk kantor DPRD
- [ ] Informasi detail lokasi:
  - [ ] Alamat lengkap
  - [ ] Jam operasional
  - [ ] Nomor telepon
  - [ ] Email
- [ ] Directions/route dari lokasi user
- [ ] Street view (optional)
- [ ] Implementasi search nearby (ATM, parkir, dll) - optional

**Dependencies:**
- `google_maps_flutter`
- `geolocator` (untuk user location)
- `url_launcher` (untuk open Google Maps app)

**API Requirements:**
- Google Maps API Key (Android & iOS)
- Enable Maps SDK di Google Cloud Console

**Technical Notes:**
- Koordinat kantor DPRD Kabupaten Bandung
- Info detail kantor (alamat, telp, jam buka)
- Permission untuk location access
- Fallback jika location permission denied

---

## Future Considerations

### Low Priority Features
- [ ] Dark mode theme
- [ ] Document sharing via social media
- [ ] Document print functionality
- [ ] Advanced search filters
- [ ] Document comparison tool
- [ ] Reading history analytics
- [ ] User profile customization
- [ ] Accessibility improvements

### Technical Debt
- [ ] Add unit tests
- [ ] Add widget tests
- [ ] Add integration tests
- [ ] Code documentation improvements
- [ ] Performance optimization
- [ ] Error logging and monitoring (Sentry/Firebase Crashlytics)
- [ ] Analytics integration (Google Analytics/Firebase Analytics)

---

## Completed Features (v1.2.0)

- [x] Perbaikan menu struktur organisasi
- [x] Menambahkan fitur statistik pengunjung
- [x] Menambahkan hukum populer dan hukum terbaru
- [x] Menambahkan fitur bookmark
- [x] Menambahkan fitur simpan offline dokumen

See [CHANGELOG.md](./CHANGELOG.md) for detailed information about completed features.

---

## Contributing

Untuk menambah atau mengubah TODO items:
1. Update file ini dengan task baru
2. Assign priority (High/Medium/Low)
3. Breakdown task menjadi sub-tasks yang actionable
4. Koordinasi dengan team untuk API requirements
5. Update status saat mulai mengerjakan

## Notes

- Priority bisa berubah berdasarkan kebutuhan bisnis
- Beberapa fitur memerlukan koordinasi dengan backend team
- Estimasi waktu akan ditambahkan setelah technical analysis
- Dependencies baru harus review dulu sebelum ditambahkan ke pubspec.yaml
