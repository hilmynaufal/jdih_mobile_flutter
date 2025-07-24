import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/artikel_model.dart';
import 'package:jdih_mobile_flutter/models/dokumen_model.dart';
import 'package:jdih_mobile_flutter/models/jdih_models/berita_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_artikel_page.dart';
import 'package:jdih_mobile_flutter/views/detail_berita_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BeritaCard extends StatelessWidget {
  const BeritaCard({super.key, required this.berita, required this.textTheme});

  final BeritaModel berita;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailBeritaPage(berita: berita));
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  berita.gambar ?? "",
                  loadingBuilder: (context, child, loadingProgress) {
                    return Skeletonizer(
                      enabled: loadingProgress != null,
                      child: child,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      berita.username!,
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      berita.judul!,
                      style: textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateTimeParse.getTanggalToDisplay(
                            berita.tanggal ?? '',
                          ),
                          style: textTheme.bodySmall!.copyWith(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.visibility, size: 12),
                            SizedBox(width: 8),
                            Text(
                              berita.dibaca ?? "0",
                              style: textTheme.bodySmall!.copyWith(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
