import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:jdih_mobile_flutter/models/jdih_models/detail_dokumen_model.dart';
import 'package:jdih_mobile_flutter/utils/datetime_parse.dart';

class DokumenCard extends StatelessWidget {
  const DokumenCard({
    super.key,
    required this.dokumen,
    required this.textTheme,
    // required this.type,
  });

  final DetailDokumenModel dokumen;
  final TextTheme textTheme;
  // final String type;

  // String getDisplayedType(String type) {
  //   if (type == Constant.JENIS_DOKUMEN_STATISTIK_CODE) {
  //     return dokumen.jenisDokumen!;
  //   } else if (type == Constant.JENIS_PPID_STATISTIK_CODE) {
  //     return dokumen.jenisPpid!;
  //   } else {
  //     return dokumen.jenisInformasi!;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              FontAwesomeIcons.filePdf,
              color: Colors.blue.shade600,
              size: 40,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${dokumen.judul}',
                  style: textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  dokumen.namaDokumen!,
                  style: textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${dokumen.statusNama}'.toUpperCase(),
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTimeParse.getTanggalToDisplay(
                        dokumen.tanggalDitetapkan ?? '',
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
                          dokumen.dibaca ?? "0",
                          style: textTheme.bodySmall!.copyWith(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.download, size: 12),
                        SizedBox(width: 8),
                        Text(
                          dokumen.didownload ?? "0",
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
    );
  }
}
