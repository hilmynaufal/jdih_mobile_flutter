import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/models/riwayat_layanan_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_layanan_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LayananCard extends StatelessWidget {
  const LayananCard({super.key, required this.layanan});

  final RiwayatLayananModel layanan;

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: () {
        Get.to(
          () => DetailLayananPage(
            riwayatLayanan: layanan,
            title: "Detail Layanan",
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    layanan.servicesId == "1"
                        ? "assets/icon_permohonan_informasi.png"
                        : "assets/icon_keberatan_informasi.png",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        layanan.mppServicesName ?? "",
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${DateTimeParse.getTanggalToDisplay(layanan.dateQueue)} ${layanan.timeQueue}",
                        style: textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green,
                        ),
                        child: Text(
                          "Antrian - ${layanan.mppCounterName}${layanan.numberQueue}",
                          style: textTheme.bodySmall!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
