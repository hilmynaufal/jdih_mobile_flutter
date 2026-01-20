// ignore_for_file: prefer_const_constructors

// import 'package:beladiri_flutter/controllers/berita_controller.dart';
// import 'package:beladiri_flutter/screens/detail_pesan_screen.dart';
// import 'package:beladiri_flutter/utils/datetime_parse.dart';
// import 'package:beladiri_flutter/utils/shared_prefs.dart';
// import 'package:beladiri_flutter/widgets/item_pesan.dart';
// import 'package:beladiri_flutter/widgets/main_app_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/profile_controller.dart';
import 'package:jdih_mobile_flutter/models/desa_model.dart';
import 'package:jdih_mobile_flutter/models/education_model.dart';
import 'package:jdih_mobile_flutter/models/gender_model.dart';
import 'package:jdih_mobile_flutter/models/kecamatan_model.dart';

import 'package:jdih_mobile_flutter/models/work_model.dart';
import 'package:jdih_mobile_flutter/simple_list_bottomsheet.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/utils/shared_prefs.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

// import '../widgets/berita_card.dart';
// import '../widgets/berita_headline_card_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final profileController = Get.put(ProfileController());
  final controller = Get.find<SharedPrefs>();

  Future<String?> getSelectedDate(BuildContext context) async {
    final firstDate = DateTime(1900);
    final lastDate = DateTime(2111);
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null) {
      return selectedDate.toString();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit Profile', style: GoogleFonts.poppins()),
        // forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Container(
          color: theme.colorScheme.onPrimary,
          child: Column(
            children: [
              // MainAppBar(
              //     prefix: Text(
              //       "Edit Profile",
              //       style: GoogleFonts.poppins(
              //           fontSize: 16, fontWeight: FonftWeight.bold),
              //     ),
              //     suffix: IconButton(
              //       icon: Icon(Icons.cancel_sharp),
              //       onPressed: () => Get.back(),
              //     ),
              //     background: Colors.white),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                        getEnabledTextField(
                          name: "Nama",
                          controller: TextEditingController(
                            text: controller.nama.value ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.fullname = value;
                            profileController.tempUser.refresh();
                          },
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
                        getEnabledTextField(
                          name: "NIK",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.code ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.code = value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "No. KK",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getEnabledTextField(
                          name: "No. KK",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.familyCode ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.familyCode =
                                value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Username",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getEnabledTextField(
                          name: "Username",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.username ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.username = value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Tanggal Lahir",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(() {
                          return InkWell(
                            onTap: () async {
                              final selectedDate = await getSelectedDate(
                                context,
                              );

                              final birth = DateTimeParse.getTrimmedTanggal(
                                selectedDate ?? "",
                              );

                              controller.modelUser.value?.birth = birth;
                              controller.modelUser.refresh();
                            },
                            child: getDisabledTextField(
                              name: "Tanggal Lahir",
                              controller: TextEditingController(
                                text:
                                    controller.modelUser.value?.gender == null
                                        ? "-"
                                        : DateTimeParse.getTanggalToDisplay(
                                          controller.modelUser.value?.birth ??
                                              "",
                                        ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 16),
                        Text(
                          "Jenis Kelamin",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(() {
                          return InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                SimpleListBottomsheet(
                                  list: [
                                    GenderModel(name: "Laki-laki", id: "1"),
                                    GenderModel(id: "0", name: "Perempuan"),
                                  ],
                                  title: "Pilih Jenis Kelamin",
                                  onTap: (e) {
                                    Get.back();
                                    final gender = e as GenderModel;

                                    controller.modelUser.value?.gender =
                                        gender.id;

                                    controller.modelUser.refresh();

                                    // profileController.selectedGender.value =
                                    //     gender;
                                  },
                                ),
                                // isScrollControlled: true,
                                backgroundColor: Colors.white,
                              );
                            },
                            child: getDisabledTextField(
                              name: "Jenis Kelamin",
                              controller: TextEditingController(
                                text:
                                    controller.modelUser.value?.gender == null
                                        ? "-"
                                        : controller.modelUser.value?.gender ==
                                            "1"
                                        ? "Laki-laki"
                                        : "Perempuan",
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 16),
                        Text(
                          "Kecamatan",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(() {
                          return InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                SimpleListBottomsheet(
                                  list: profileController.kecamatans,
                                  title: "Pilih Kecamatan",
                                  onTap: (e) {
                                    Get.back();
                                    final district = e as KecamatanModel;
                                    profileController
                                        .tempUser
                                        .value
                                        ?.districtId = district.id;

                                    profileController
                                        .tempUser
                                        .value
                                        ?.villageId = null;
                                    profileController.tempUser.refresh();

                                    profileController.desas.clear();

                                    profileController.getDesaList(
                                      kecamatanId: district.id,
                                    );

                                    // profileController.selectedGender.value =
                                    //     gender;
                                  },
                                ),
                                // isScrollControlled: true,
                                backgroundColor: Colors.white,
                              );
                            },
                            child: getDisabledTextField(
                              name: "Kecamatan",
                              controller: TextEditingController(
                                text:
                                    profileController
                                                .tempUser
                                                .value
                                                ?.districtId ==
                                            null
                                        ? "-"
                                        : profileController.kecamatans.isEmpty
                                        ? "Loading data..."
                                        : profileController.kecamatans
                                            .firstWhere(
                                              (element) =>
                                                  element.id ==
                                                  profileController
                                                      .tempUser
                                                      .value
                                                      ?.districtId,
                                            )
                                            .name,
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 16),
                        Text(
                          "Desa",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(() {
                          return InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                SimpleListBottomsheet(
                                  list: profileController.desas,
                                  title: "Pilih Desa",
                                  onTap: (e) {
                                    Get.back();
                                    final village = e as DesaModel;
                                    profileController
                                        .tempUser
                                        .value
                                        ?.villageId = village.id;

                                    profileController.tempUser.refresh();

                                    // profileController.selectedGender.value =
                                    //     gender;
                                  },
                                ),
                                // isScrollControlled: true,
                                backgroundColor: Colors.white,
                              );
                            },
                            child: getDisabledTextField(
                              name: "Desa",
                              controller: TextEditingController(
                                text:
                                    profileController
                                                .tempUser
                                                .value
                                                ?.villageId ==
                                            null
                                        ? "-"
                                        : profileController.desas.isEmpty
                                        ? "Loading data..."
                                        : profileController.desas
                                            .firstWhere(
                                              (element) =>
                                                  element.id ==
                                                  profileController
                                                      .tempUser
                                                      .value
                                                      ?.villageId,
                                            )
                                            .name,
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 16),
                        Text(
                          "Pendidikan Terakhir",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(() {
                          if (profileController.educations.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                SimpleListBottomsheet(
                                  list: profileController.educations,
                                  title: "Pilih Pendidikan Terakhir",
                                  onTap: (e) {
                                    Get.back();
                                    final education = e as EducationModel;

                                    controller.modelUser.value?.educationId =
                                        education.idEducation;
                                    controller.modelUser.refresh();
                                  },
                                ),
                                // isScrollControlled: true,
                                backgroundColor: Colors.white,
                              );
                            },
                            child: getDisabledTextField(
                              name: "Penididkan Terakhir",
                              controller: TextEditingController(
                                text:
                                    controller.modelUser.value?.educationId ==
                                            null
                                        ? "-"
                                        : profileController.educations
                                            .firstWhere(
                                              (element) =>
                                                  element.idEducation ==
                                                  controller
                                                      .modelUser
                                                      .value
                                                      ?.educationId,
                                            )
                                            .name,
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 16),
                        Text(
                          "Pekerjaan Saat Ini",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        Obx(() {
                          if (profileController.works.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                SimpleListBottomsheet(
                                  list: profileController.works,
                                  title: "Pilih Pekerjaan",
                                  onTap: (e) {
                                    Get.back();
                                    final work = e as WorkModel;

                                    // profileController.selectedWork.value =
                                    //     work;
                                    controller.modelUser.value?.workId =
                                        work.idJob;
                                    controller.modelUser.refresh();
                                  },
                                ),
                                // isScrollControlled: true,
                                backgroundColor: Colors.white,
                              );
                            },
                            child: getDisabledTextField(
                              name: "Pekerjaan Saat Ini",
                              controller: TextEditingController(
                                text:
                                    controller.modelUser.value?.workId == null
                                        ? "-"
                                        : profileController.works
                                            .firstWhere(
                                              (element) =>
                                                  element.idJob ==
                                                  controller
                                                      .modelUser
                                                      .value
                                                      ?.workId,
                                            )
                                            .name,
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 16),
                        Text(
                          "Nama Instansi / Perusahaan / Usaha ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getEnabledTextField(
                          name: "Nama Instansi / Perusahaan / Usaha",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.workName ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.workName = value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Unit Kerja",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getEnabledTextField(
                          name: "Unit Kerja",
                          controller: TextEditingController(
                            text:
                                controller.modelUser.value?.workDivision ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.workDivision =
                                value;
                            profileController.tempUser.refresh();
                          },
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
                        getEnabledTextField(
                          name: "No. Telepon",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.phone ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.phone = value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Alamat Email",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getEnabledTextField(
                          name: "Alamat Email",
                          controller: TextEditingController(
                            text: controller.modelUser.value?.email ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.email = value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Alamat",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        getEnabledTextField(
                          name: "Alamat",
                          controller: TextEditingController(
                            text:
                                controller.modelUser.value?.description ?? "-",
                          ),
                          onChanged: (value) {
                            profileController.tempUser.value?.description =
                                value;
                            profileController.tempUser.refresh();
                          },
                        ),
                        SizedBox(height: 16),
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
                      barrierDismissible: false,
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
                    profileController.editProfile(
                      onSuccess: () {
                        Get.back();
                        Get.back();
                        Get.showSnackbar(
                          SnackbarUtils.successSnackbar(
                            title: "Success",
                            text: "Profile Berhasil Disimpan!",
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
                    "Simpan Profil",
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
