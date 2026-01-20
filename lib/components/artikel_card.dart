import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jdih_mobile_flutter/http_server.dart';
import 'package:jdih_mobile_flutter/models/artikel_model.dart';

import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';
import 'package:jdih_mobile_flutter/views/detail_artikel_page.dart';

class ArtikelCard extends StatelessWidget {
  const ArtikelCard({
    super.key,
    required this.artikel,
    required this.textTheme,
  });

  final ArtikelModel artikel;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailArtikelPage(artikel: artikel));
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
                  artikel.imageArticle?.replaceFirst(
                        "https://ppid.bandungkab.go.id/",
                        "${Get.find<HttpServer>().apiUrl}",
                      ) ??
                      "",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value:
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                      ),
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
                      artikel.namaInstansi!,
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      artikel.namaArtikel!,
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
                            artikel.createdDate ?? '',
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
                              artikel.totalDilihat ?? "0",
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
