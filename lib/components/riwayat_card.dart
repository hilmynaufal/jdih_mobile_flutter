import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/riwayat_dokumen_model.dart';
import '../utils/datetime_parse.dart';

class RiwayatCard extends StatelessWidget {
  final RiwayatDokumenModel riwayat;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const RiwayatCard({
    super.key,
    required this.riwayat,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
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
                    '${riwayat.judul}',
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    riwayat.jenisNama!,
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
                      riwayat.tahun!.toUpperCase(),
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
                          riwayat.tanggalDilihat.toString(),
                        ),
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tombol hapus
            if (onDelete != null)
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.shade400,
                  size: 20,
                ),
                tooltip: 'Hapus dari riwayat',
              ),
          ],
        ),
      ),
    );
  }
}
