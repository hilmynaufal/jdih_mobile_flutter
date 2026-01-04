# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

JDIH Mobile Flutter is a mobile application for the JDIH DPRD Kabupaten Bandung (Legal Documentation and Information Network). The app provides access to legal documents, news articles, and related services for the Bandung Regency Legislative Council.

**Package Name**: `com.diskominfo.jdih_mobile_flutter`
**Main API**: `https://jdihdprd.bandungkab.go.id/`

## Development Commands

### Flutter Commands
```bash
# Install dependencies
flutter pub get

# Run the app (development)
flutter run

# Build for Android
flutter build apk --release

# Build for Android (app bundle)
flutter build appbundle --release

# Clean build artifacts
flutter clean
```

### Code Generation
The project uses Hive for local storage with code generation:

```bash
# Generate Hive adapters and other generated files
dart run build_runner build

# Watch for changes and regenerate
dart run build_runner watch

# Delete conflicting outputs and regenerate
dart run build_runner build --delete-conflicting-outputs
```

Run `build_runner` whenever you modify models annotated with `@HiveType` or other code generation annotations.

### Linting
```bash
# Analyze code
flutter analyze
```

### Icon Generation
```bash
# Generate app launcher icons from assets/ic_launcher.png
flutter pub run flutter_launcher_icons
```

## Architecture Overview

### State Management
The app uses **GetX** for state management, dependency injection, and routing:
- Controllers extend `GetxController` and are initialized in `main.dart`
- Reactive variables use `.obs` suffix (e.g., `selectedIndex.obs`)
- Controllers are accessed via `Get.find<ControllerName>()` or `Get.put()`
- Navigation uses GetX routing: `Get.to()`, `Get.back()`, etc.

### Project Structure

```
lib/
├── main.dart                    # App entry point, global GetX controller initialization
├── bottom_nav_controller.dart   # Bottom navigation state management
├── http_server.dart             # Centralized HTTP client (GET/POST requests)
├── constant.dart                # App-wide constants, filter fields, service IDs
│
├── views/                       # UI screens/pages
│   ├── home_page.dart          # Main dashboard
│   ├── artikel_page.dart       # Articles listing
│   ├── berita_page.dart        # News listing
│   ├── cari_dokumen_page.dart  # Document search
│   ├── riwayat_page.dart       # Document history
│   ├── detail_dokumen_page.dart
│   ├── detail_artikel_page.dart
│   └── ...
│
├── controllers/                 # GetX controllers (business logic)
│   ├── home_controller.dart
│   ├── dokumen_controller.dart
│   ├── artikel_controller.dart
│   ├── berita_controller.dart
│   ├── login_controller.dart
│   ├── riwayat_controller.dart
│   └── ...
│
├── models/                      # Data models
│   ├── jdih_models/            # JDIH-specific models
│   │   ├── detail_dokumen_model.dart
│   │   ├── berita_model.dart
│   │   ├── halaman_statis_model.dart
│   │   └── kategori_dokumen_model.dart
│   ├── riwayat_dokumen_model.dart  # Hive model for local history
│   ├── login_model.dart
│   ├── user_model.dart
│   └── ...
│
├── components/                  # Reusable UI widgets
│   ├── dokumen_card.dart
│   ├── artikel_card.dart
│   ├── berita_card.dart
│   ├── riwayat_card.dart
│   └── ...
│
├── utils/                       # Utility classes
│   ├── shared_prefs.dart       # SharedPreferences wrapper for user session
│   ├── riwayat_service.dart    # Hive service for document history
│   ├── http_override.dart      # SSL certificate override for development
│   ├── snackbar_utils.dart     # Snackbar helpers
│   └── ...
│
└── *_bottomsheet.dart          # Bottom sheet dialogs
```

### Key Architectural Patterns

**HTTP Communication**
All API calls go through `HttpServer` (lib/http_server.dart):
- `getRequest(subdomain)` - GET requests
- `postRequest(subdomain, body)` - POST with JSON body
- `postMultiPart(subdomain, fields)` - Multipart form data
- Base URL is configurable via `apiUrl` observable

**Local Storage**
Three mechanisms for persistence:
1. **SharedPreferences** (via `SharedPrefs` controller): User session data, login state
2. **Hive** (via multiple services): Local data storage
   - `RiwayatService`: Document viewing history (max 100 items)
   - `BookmarkService`: Bookmarked documents
   - `OfflineService`: Offline document storage

**Document History**
Hive is used to store document viewing history locally:
- Models must extend `HiveObject` and use `@HiveType` annotation
- TypeAdapters are auto-generated via `build_runner`
- History is limited to 100 most recent items
- Managed through `RiwayatService` singleton

**Bookmark Feature (v1.2+)**
Users can bookmark documents for quick access:
- Bookmark/unbookmark from detail page
- Stored locally using Hive (`BookmarkDokumenModel`)
- Managed through `BookmarkController` and `BookmarkService`
- Dedicated bookmark page in bottom navigation
- Persistent across app sessions

**Offline Storage (v1.2+)**
Documents can be saved for offline access:
- Download and store documents locally
- Access without internet connection
- Managed through `OfflineController` and `OfflineService`
- Uses Hive for metadata storage (`OfflineDokumenModel`)
- Dedicated offline page for viewing saved documents

**Navigation**
GetX navigation with named routes defined in `main.dart`:
- `/splash` - Animated splash screen
- `/splash-simple` - Simple splash (initial route)
- `/kebijakan-privasi` - Static privacy policy
- `/` - Main app with bottom navigation

**Bottom Navigation**
Managed by `BottomNavController`:
- 4 tabs: Home, Artikel (News), Cari (Search), Riwayat (History)
- Tab state persists across navigation

**Home Page Features (v1.2+)**
The home page includes several dynamic widgets:
- **Visitor Statistics Widget**: Real-time visitor statistics
  - Today's visitors count
  - Today's hits count
  - Total visitors count
  - Last update timestamp
  - API: `api/Tampil_hukum/statistik`

- **Hukum Terbaru Widget**: Latest legal documents
  - Horizontal scrollable list of 5 newest documents
  - Shows: document name, type, number & year, views, downloads
  - Tap to view full details
  - API: `api/Tampil_hukum/hukum_terbaru`

- **Hukum Populer Widget**: Most popular legal documents
  - Horizontal scrollable list of 5 most viewed documents
  - Shows: document name, type, number & year, views, downloads
  - Tap to view full details
  - API: `api/Tampil_hukum/hukum_populer`

All home widgets implement:
- Loading states with Skeletonizer
- Automatic data fetching on first render
- Error handling with user feedback
- Detail fetching before navigation (for hukum terbaru/populer)

## Important Implementation Details

### SSL Certificate Handling
The app uses a custom `HttpOverride` to bypass SSL certificate validation in development. This is set globally in `main.dart`:
```dart
HttpOverrides.global = HttpOverride();
```

### Android Configuration
- **Namespace**: `com.diskominfo.jdih_mobile_flutter` (recently changed from `com.example`)
- **Minimum SDK**: Defined by Flutter defaults
- **Target SDK**: Defined by Flutter defaults
- **NDK Version**: 27.0.12077973
- **Keystore**: Configured via `key.properties` file for release builds
- **ProGuard**: Rules defined in `android/app/proguard-rules.pro`

### Initialization Sequence
On app startup (in `main.dart`):
1. Initialize Flutter bindings
2. Initialize Hive database (`RiwayatService.initialize()`)
3. Initialize FlutterDownloader plugin (non-web only)
4. Set HTTP overrides for SSL
5. Initialize GetX controllers
6. Navigate to splash screen

### GetX Controllers Initialization
All controllers are initialized globally in `MyApp` widget:
```dart
final server = Get.put(HttpServer());
final dokumenController = Get.put(DokumenController());
final sharedPrefs = Get.put(SharedPrefs());
// ... etc
```
This ensures controllers are available throughout the app lifecycle.

## API Integration Notes

- Base API URL is hardcoded to `https://jdihdprd.bandungkab.go.id/`
- API responses should be JSON formatted
- Most endpoints require subdomain path to be passed to `HttpServer` methods
- Error handling is typically done in controllers, with snackbar feedback to users

## Testing & Building

Currently no automated tests are configured. When adding tests:
- Place unit tests in `test/` directory
- Place widget tests alongside code or in `test/`
- Integration tests should go in `integration_test/` directory

## Key Dependencies

- **get**: State management, dependency injection, routing
- **google_fonts**: Poppins font family (app-wide)
- **hive & hive_flutter**: Local NoSQL database for:
  - Document viewing history
  - Bookmarked documents
  - Offline document storage
- **shared_preferences**: Key-value storage for user session
- **flutter_downloader**: Document download management
- **permission_handler**: Runtime permissions for downloads
- **flutter_pdfview**: PDF document viewer
- **photo_view**: Image zoom viewer
- **flutter_widget_from_html**: Render HTML content
- **lottie**: Animation support
- **pinput**: OTP/PIN input fields
- **skeletonizer**: Loading skeleton UI
- **intl**: Number and date formatting (visitor statistics, etc.)

## Version History

### Version 1.2.0 (Current)
**New Features:**
- Visitor statistics widget on home page
- Latest legal documents (Hukum Terbaru) widget
- Popular legal documents (Hukum Populer) widget
- Bookmark feature for saving favorite documents
- Offline storage for documents
- Fixed organizational structure menu with download capability

See [CHANGELOG.md](./CHANGELOG.md) for detailed version history.

### Planned Features
See [TODO.md](./TODO.md) for upcoming features and improvements.
