import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/kategori_dokumen_model.dart';
import 'package:jdih_mobile_flutter/views/simple_page.dart';

class CariBottomsheet extends StatelessWidget {
  CariBottomsheet({super.key});

  final cariController = TextEditingController();
  final cariTahunController = TextEditingController();
  final cariNoController = TextEditingController();
  final dokumenController = Get.find<DokumenController>();
  final bottomsheetController = Get.put(CariBottomSheetController());

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    final textTheme = theme.textTheme;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              controller: cariController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text("Cari..."),
                floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                  color: theme.primaryColor,
                ),
                labelStyle: textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade400,
                ),
                isDense: true,
                prefixIconConstraints: BoxConstraints.tight(Size(48, 48)),
                focusColor: theme.primaryColor,
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 16,
          // ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Langkah-langkah...",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 16,
                      child: Text(
                        "1",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Masukan nama peraturan produk hukum yang ingin anda cari di form diatas.",
                        style: GoogleFonts.poppins(
                          // fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 16,
                      child: Text(
                        "2",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Pilih Filter Kategori, Tahun, Nomor produk hukum yang ingin anda cari (kosongkan jika ingin menampilkan semua kategori).",
                        style: GoogleFonts.poppins(
                          // fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 16,
                      child: Text(
                        "3",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Klik tombol cari di paling bawah.",
                        style: GoogleFonts.poppins(
                          // fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 16,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "Belum mempunyai akun?",
          //       style: GoogleFonts.poppins(
          //           fontWeight: FontWeight.w600,
          //           color: Colors.black),
          //       textAlign: TextAlign.center,
          //     ),
          //     Text(
          //       " Daftar",
          //       style: GoogleFonts.poppins(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.blue),
          //       textAlign: TextAlign.center,
          //     ),
          //   ],
          // ),
          SizedBox(height: 16),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Get.to(() => MasukPinPage());
          //       Get.find<LoginController>().cekUsernameTerisi(
          //         onSuccess: () => Get.to(() => MasukPinPage()),
          //         onNotFound:
          //             () => Get.to(
          //               () => RegisterPage(
          //                 title:
          //                     'Maaf, kami tidak menemukan akun yang sesuai dengan username yang anda berikan.',
          //                 subtitle:
          //                     'Jika anda ingin membuat akun baru dengan username ${Get.find<LoginController>().usernameTec.text}, silahkan isi identitas anda terlebih dahulu.',
          //                 bottomText:
          //                     'Jika anda berpikir kalau ini adalah sebuah kesalahan, anda bisa menghubungi pihak Diskominfo, atau kembali ke menu sebelumnya.',
          //                 username:
          //                     Get.find<LoginController>().usernameTec.text,
          //               ),
          //             ),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: theme.primaryColor,
          //       foregroundColor: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     child: Text(
          //       "Masuk",
          //       style: GoogleFonts.poppins(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 8),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter Kategori",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Obx(() {
                  final cariKategori = [
                    KategoriDokumenModel(
                      jenisNama: "Tampil Semua",
                      jenisKeterangan: "",
                    ),
                    ...dokumenController.kategori,
                  ];
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 4,
                    ),
                    itemCount: cariKategori.length,
                    itemBuilder: (context, index) {
                      final category = cariKategori[index];
                      return InkWell(
                        onTap: () {
                          // Get.back();
                          dokumenController.selectedCariCategory.value =
                              category.jenisKeterangan ?? "";
                        },
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color:
                                    dokumenController
                                                .selectedCariCategory
                                                .value ==
                                            category.jenisKeterangan
                                        ? theme.primaryColor
                                        : Colors.grey.shade300,
                                width:
                                    dokumenController
                                                .selectedCariCategory
                                                .value ==
                                            category.jenisKeterangan
                                        ? 2
                                        : 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                category.jenisNama ?? '',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      dokumenController
                                                  .selectedCariCategory
                                                  .value ==
                                              category.jenisKeterangan
                                          ? theme.primaryColor
                                          : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter Tahun",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: cariTahunController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text("Filter tahun..."),
                    floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor,
                    ),
                    labelStyle: textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade400,
                    ),
                    isDense: true,
                    prefixIconConstraints: BoxConstraints.tight(Size(48, 48)),
                    focusColor: theme.primaryColor,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter No.",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: cariNoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text("Filter No..."),
                    floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor,
                    ),
                    labelStyle: textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade400,
                    ),
                    isDense: true,
                    prefixIconConstraints: BoxConstraints.tight(Size(48, 48)),
                    focusColor: theme.primaryColor,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    color: Colors.grey.shade200,
                    // width: double.infinity,
                    height: 2,
                  ),
                ),
              ),
              Text(
                "dan",
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    color: Colors.grey.shade200,
                    // width: double.infinity,
                    height: 2,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                Get.to(
                  () => SimplePage(
                    title: cariController.text,
                    jenisKeterangan:
                        dokumenController.selectedCariCategory.value,
                    tahun: cariTahunController.text,
                    no: cariNoController.text,
                    keyword: cariController.text,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Cari",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class CariBottomSheetController extends GetxController {
  final isTampilFilter = false.obs;
}
