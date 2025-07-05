import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/buat_layanan_controller.dart';
import 'package:jdih_mobile_flutter/controllers/profile_controller.dart';
import 'package:jdih_mobile_flutter/models/desa_model.dart';
import 'package:jdih_mobile_flutter/models/education_model.dart';
import 'package:jdih_mobile_flutter/models/gender_model.dart';
import 'package:jdih_mobile_flutter/models/kecamatan_model.dart';
import 'package:jdih_mobile_flutter/models/work_model.dart';
import 'package:jdih_mobile_flutter/simple_list_bottomsheet.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/utils/simple_multicolored_line.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

class BuatLayananPage extends StatelessWidget {
  BuatLayananPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buatLayananController,
  });

  final String title, subtitle;

  final BuatLayananController buatLayananController;
  final controller = Get.find<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: false,
        surfaceTintColor: Colors.white,
        // title: Text(
        //   title,
        //   style: GoogleFonts.poppins(),
        // ),
      ),
      body: SafeArea(
        child: Container(
          color: theme.colorScheme.onPrimary,
          child: Column(
            children: [
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16),
                        SimpleMulticoloredLine.horizontal,
                        SizedBox(height: 16),
                        Text(
                          subtitle,
                          // textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: theme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Data Dasar",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Nama",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getDisabledTextField(
                          name: "Nama",
                          controller: TextEditingController(
                            text: controller.nama.value ?? "-",
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "NIK",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getDisabledTextField(
                          name: "NIK",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.code ?? "-",
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "No. Telepon",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getDisabledTextField(
                          name: "No. Telepon",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.phone ?? "-",
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Formulir Keterangan",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Card(
                          elevation: 0,
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Isi keterangan formulir dengan jelas (Nama Dokumen, Jenis Dokumen dan Keperluan)",
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 150,
                          child: getEnabledTextField(
                            name: "Keterangan Formulir...",
                            controller: TextEditingController(),
                            onChanged: (String value) {},
                          ),
                        ),
                        SizedBox(height: 64),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        );
                      },
                    );
                    buatLayananController.buatPermohonan(
                      onSuccess: () {
                        Get.back();
                        Get.back();
                        Get.showSnackbar(
                          SnackbarUtils.successSnackbar(
                            title: "Success",
                            text: "Permohonan berhasil dibuat!",
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Buat Permohonan",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getEnabledTextField({
    required String name,
    required TextEditingController controller,
    required void Function(String value) onChanged,
  }) {
    final theme = Get.theme;
    final textTheme = theme.textTheme;
    return TextField(
      // enabled: false,
      maxLines: null,
      expands: true,
      textAlignVertical: TextAlignVertical.top,
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text("$name..."),
        floatingLabelStyle: textTheme.bodyMedium!.copyWith(
          color: theme.primaryColor,
        ),
        labelStyle: textTheme.bodyMedium!.copyWith(color: Colors.grey.shade400),
        isDense: true,
        prefixIconConstraints: BoxConstraints.tight(Size(48, 48)),
        focusColor: theme.primaryColor,
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget getDisabledTextField({
    required String name,
    required TextEditingController controller,
  }) {
    final theme = Get.theme;
    final textTheme = theme.textTheme;
    return TextField(
      controller: controller,
      enabled: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text("$name..."),
        floatingLabelStyle: textTheme.bodyMedium!.copyWith(
          color: theme.primaryColor,
        ),
        labelStyle: textTheme.bodyMedium!.copyWith(color: Colors.grey.shade400),
        isDense: true,
        prefixIconConstraints: BoxConstraints.tight(Size(48, 48)),
        focusColor: theme.primaryColor,
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
