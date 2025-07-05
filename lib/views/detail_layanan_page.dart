import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/models/riwayat_layanan_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/abstract_main_dashboard_page.dart';
import 'package:jdih_mobile_flutter/views/edit_profile_screen.dart';

class DetailLayananPage extends AbstractMainDashboardPage {
  const DetailLayananPage({
    super.key,
    required this.riwayatLayanan,
    required super.title,
  });

  final RiwayatLayananModel riwayatLayanan;
  // final controller = Get.find<SuratController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return buildWidgetWithSliverAppBar(
      context,
      expandedAppBarHeight: 300,
      appbarItem: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              riwayatLayanan.mppServicesName ?? "",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(
                riwayatLayanan.dateQueue.toString(),
              ),
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: theme.colorScheme.error,
                    onPressed: () {
                      // Fungsi hapus
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Batalkan permohonan surat?",
                              style: GoogleFonts.poppins(),
                            ),
                            content: Text(
                              "Apakah Anda yakin ingin membatalkan permohonan ini?",
                              style: GoogleFonts.poppins(),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  "Tidak",
                                  style: GoogleFonts.poppins(),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Batalkan Permohonan",
                                  style: GoogleFonts.poppins(
                                    color: theme.colorScheme.error,
                                  ),
                                ),
                                onPressed: () {
                                  // Fungsi hapus surat
                                  // controller.batalkanSurat(
                                  //     riwayatLayanan.id ?? "");
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    getStatus(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      // elevation: 8,
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
                                  "Permohonan Anda Akan di Proses Apabila sudah Isi Formulir Permohonan (Lengkap, Jelas & Sesuai).",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Get.to(() => EditProfileScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Isi Formulir",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      // elevation: 0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_add_alt_1_rounded,
                                  size: 64,
                                  color: theme.primaryColor,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Lengkapi profile-mu!",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: theme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        "Lengkapi profile-mu dengan jelas dan lengkap agar mempercepat proses verifikasi",
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => EditProfileScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Lengkapi Profile",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.help, size: 28),
                              SizedBox(width: 10),
                              Text(
                                "Info Permohonan",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Kode Permohonan",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                size: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "${riwayatLayanan.idQueue}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Divider(height: 8, color: Colors.grey.shade200),
                          SizedBox(height: 16),
                          Text(
                            "No. Antrian",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.book, size: 20, color: Colors.black),
                              SizedBox(width: 4),
                              Text(
                                "Antrian - ${riwayatLayanan.mppCounterName}${riwayatLayanan.numberQueue}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 8, color: Colors.grey.shade200),
            SizedBox(height: 16),
            riwayatLayanan.finishStatus ==
                    "5" //
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: suratDibatalkanTrackerWidget(),
                    ),
                  ),
                )
                : riwayatLayanan.status == "1"
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: suratBelumLengkapTrackerWidget(),
                    ),
                  ),
                )
                : statusTrackerWidget(),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  List<Widget> getIsianFormListWidget(String isian) {
    final Map<String, dynamic> map = jsonDecode(isian);
    log("message: $map");

    return map.keys
        .map(
          (e) => Column(
            children: [
              Row(
                children: [
                  Text(
                    e.replaceAll("_", " ").capitalizeFirst ?? "",
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        map[e] ?? "-",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              // Divider(
              //   color: Colors.grey.shade200,
              // ),
              // SizedBox(
              //   height: 4,
              // )
            ],
          ),
        )
        .toList();
  }

  Widget suratDibatalkanTrackerWidget() {
    final theme = Get.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            border: Border.all(color: theme.colorScheme.error, width: 2),
          ),
          padding: EdgeInsets.all(7),
          child: Icon(
            CupertinoIcons.xmark_circle,
            color: theme.colorScheme.error,
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dibatalkan",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.error,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(riwayatLayanan.dateQueue),
              style: GoogleFonts.poppins(
                // fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ],
        ),
        // Spacer(),
        // int.parse(surat.status ?? "10") > 3
        //     ? Icon(
        //         CupertinoIcons.check_mark_circled_solid,
        //         color: theme.primaryColor,
        //       )
        //     : SizedBox()
      ],
    );
  }

  Widget suratBelumLengkapTrackerWidget() {
    final theme = Get.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          padding: EdgeInsets.all(7),
          child: Icon(CupertinoIcons.xmark_circle, color: Colors.grey.shade400),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Belum Lengkap",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(riwayatLayanan.dateQueue),
              style: GoogleFonts.poppins(
                // fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ],
        ),
        // Spacer(),
        // int.parse(surat.status ?? "10") > 3
        //     ? Icon(
        //         CupertinoIcons.check_mark_circled_solid,
        //         color: theme.primaryColor,
        //       )
        //     : SizedBox()
      ],
    );
  }

  Widget statusTrackerWidget() {
    final theme = Get.theme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          riwayatLayanan.status == "1"
              ? Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: baruTrackerWidget(riwayatLayanan.status == "1"),
                ),
              )
              : baruTrackerWidget(riwayatLayanan.status == "1"),
          riwayatLayanan.status == "1" ? SizedBox() : SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(color: Colors.grey.shade300, width: 2, height: 20),
          ),
          riwayatLayanan.verifiedStatus == "1"
              ? SizedBox()
              : SizedBox(height: 8),
          riwayatLayanan.verifiedStatus == "1"
              ? Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: verifikasiTrackerWidget(
                    riwayatLayanan.verifiedStatus == "1",
                  ),
                ),
              )
              : verifikasiTrackerWidget(riwayatLayanan.verifiedStatus == "1"),
          riwayatLayanan.verifiedStatus == "1"
              ? SizedBox()
              : SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(color: Colors.grey.shade300, width: 2, height: 20),
          ),
          riwayatLayanan.processStatus == "1"
              ? SizedBox()
              : SizedBox(height: 8),
          riwayatLayanan.processStatus == "1"
              ? Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: prosesTrackerWidget(
                    riwayatLayanan.processStatus == "1",
                  ),
                ),
              )
              : prosesTrackerWidget(riwayatLayanan.processStatus == "1"),
          riwayatLayanan.processStatus == "1"
              ? SizedBox()
              : SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(color: Colors.grey.shade300, width: 2, height: 20),
          ),
          riwayatLayanan.finishStatus == "1" ? SizedBox() : SizedBox(height: 8),
          riwayatLayanan.finishStatus == "1"
              ? Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: selesaiTrackerWidget(
                    riwayatLayanan.finishStatus == "1",
                  ),
                ),
              )
              : selesaiTrackerWidget(riwayatLayanan.finishStatus == "1"),
        ],
      ),
    );
  }

  Widget prosesTrackerWidget(bool isStatus) {
    final theme = Get.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            border: Border.all(
              color: isStatus ? theme.primaryColor : Colors.grey.shade300,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(7),
          child: Icon(CupertinoIcons.clock_fill, color: theme.primaryColor),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              riwayatLayanan.mppProcessStatus ?? "",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(riwayatLayanan.processDate),
              style: GoogleFonts.poppins(
                // fontWeight: FontWeight.bold,
                fontSize: 11,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
          ],
        ),
        Spacer(),
        int.parse(riwayatLayanan.status ?? "10") > 3
            ? Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: theme.primaryColor,
            )
            : SizedBox(),
      ],
    );
  }

  Widget selesaiTrackerWidget(bool isStatus) {
    final theme = Get.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            border: Border.all(
              color: isStatus ? theme.primaryColor : Colors.grey.shade300,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(7),
          child: Icon(
            CupertinoIcons.hand_thumbsup_fill,
            color: theme.primaryColor,
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              riwayatLayanan.mppFinishStatus ?? "",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(riwayatLayanan.finishDate),
              style: GoogleFonts.poppins(
                // fontWeight: FontWeight.bold,
                fontSize: 11,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
          ],
        ),
        Spacer(),
        int.parse(riwayatLayanan.status ?? "10") > 3
            ? Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: theme.primaryColor,
            )
            : SizedBox(),
      ],
    );
  }

  Widget baruTrackerWidget(bool isStatus) {
    final theme = Get.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: isStatus ? theme.primaryColor : Colors.grey.shade300,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Icon(CupertinoIcons.doc_checkmark, color: theme.primaryColor),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              riwayatLayanan.mppStatusQueue ?? "",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(riwayatLayanan.dateQueue),
              style: GoogleFonts.poppins(
                // fontWeight: FontWeight.bold,
                fontSize: 11,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
          ],
        ),
        Spacer(),
        int.parse(riwayatLayanan.status ?? "10") > 1
            ? Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: theme.primaryColor,
            )
            : SizedBox(),
      ],
    );
  }

  Widget verifikasiTrackerWidget(bool isStatus) {
    final theme = Get.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: isStatus ? theme.primaryColor : Colors.grey.shade300,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(7),
          child: Icon(CupertinoIcons.signature, color: theme.primaryColor),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              riwayatLayanan.mppVerifiedStatus ?? "",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
            Text(
              DateTimeParse.getTanggalToDisplay(riwayatLayanan.verifiedDate),
              style: GoogleFonts.poppins(
                // fontWeight: FontWeight.bold,
                fontSize: 11,
                color: isStatus ? Colors.black : Colors.grey.shade300,
              ),
            ),
          ],
        ),
        Spacer(),
        int.parse(riwayatLayanan.status ?? "10") > 2
            ? Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: theme.primaryColor,
            )
            : SizedBox(),
      ],
    );
  }

  String getStatus() {
    if (riwayatLayanan.finishStatus != "0") {
      return riwayatLayanan.mppFinishStatus ?? "";
    } else if (riwayatLayanan.processStatus != "0") {
      return riwayatLayanan.mppProcessStatus ?? "";
    } else if (riwayatLayanan.verifiedStatus != "0") {
      return riwayatLayanan.mppVerifiedStatus ?? "";
    } else {
      return riwayatLayanan.mppStatusQueue ?? "";
    }
  }
}
