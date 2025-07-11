import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:jdih_mobile_flutter/bottom_nav_controller.dart';
import 'package:jdih_mobile_flutter/controllers/artikel_controller.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/controllers/login_controller.dart';
import 'package:jdih_mobile_flutter/controllers/riwayat_controller.dart';
import 'package:jdih_mobile_flutter/controllers/shared_pref_controller.dart';
import 'package:jdih_mobile_flutter/views/kebijakan_privasi_page.dart';
import 'package:jdih_mobile_flutter/views/kebijakan_privasi_page_static.dart';
import 'package:jdih_mobile_flutter/utils/riwayat_service.dart';
import 'package:jdih_mobile_flutter/login_bottomsheet.dart';
import 'package:jdih_mobile_flutter/splash_screen.dart';
import 'package:jdih_mobile_flutter/utils/http_override.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await RiwayatService.initialize();

  // Plugin must be initialized before using
  if (!kIsWeb) {
    await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true, // option: set to false to disable working with http links (default: false)
    );
  }

  HttpOverrides.global = HttpOverride();

  // final String defaultLocale = Platform.localeName;

  // initializeDateFormatting(defaultLocale, '').then((_) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final server = Get.put(HttpServer());
  final dokumenController = Get.put(DokumenController());
  final sharedPrefs = Get.put(SharedPrefs());
  final homeController = Get.put(HomeController());
  final artikelController = Get.put(ArtikelController());
  final sharedPref = Get.put(SharedPrefController());
  final loginController = Get.put(LoginController());
  final riwayatController = Get.put(RiwayatController());
  final controller = Get.put(BottomNavController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JDIH Kabupaten Bandung',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00686C)),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // home: Main(),
      initialRoute: "/kebijakan-privasi",
      getPages: [
        GetPage(name: "/splash", page: () => SplashScreen()),
        GetPage(name: "/kebijakan-privasi", page: () => KebijakanPrivasiPageStatic()),
        GetPage(name: '/', page: () => Main()),
      ],
    );
  }
}

class Main extends StatelessWidget {
  Main({super.key});

  final controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.bodyWidget.elementAt(
                controller.selectedIndex.value,
              ),
            ),
          ),
          // GetX<SharedPrefs>(
          //   builder: (sharedPref) {
          //     if (sharedPref.idUser.value != null) {
          //       return const SizedBox();
          //     }
          //     return Column(
          //       children: [
          //         const Divider(),
          //         Container(
          //           height: 60,
          //           width: double.infinity,
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 16,
          //             vertical: 4,
          //           ),
          //           decoration: const BoxDecoration(color: Colors.white),
          //           child: ElevatedButton(
          //             onPressed: () {
          //               Get.bottomSheet(
          //                 const LoginBottomsheet(),
          //                 shape: const LinearBorder(),
          //                 backgroundColor: Colors.white,
          //               );
          //             },
          //             style: ElevatedButton.styleFrom(
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //             ),
          //             child: Text(
          //               "Daftar & Masuk",
          //               style: GoogleFonts.poppins(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          useLegacyColorScheme: false,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: theme.primaryColor),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          items: controller.bottomNavItem,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: theme.primaryColor),
          onTap: (value) {
            
              controller.selectedIndex.value = value;
            
          },
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
