import 'package:flutter/material.dart';

import '../models/bookmark_dokumen_model.dart';
import '../utils/datetime_parse.dart';

class BookmarkCard extends StatelessWidget {
  final BookmarkDokumenModel bookmark;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const BookmarkCard({
    super.key,
    required this.bookmark,
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
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.bookmark,
                color: Colors.amber.shade700,
                size: 40,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${bookmark.judul}',
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    bookmark.jenisNama!,
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
                      bookmark.tahun!.toUpperCase(),
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
                      Row(
                        children: [
                          Icon(
                            Icons.bookmark_added,
                            size: 14,
                            color: Colors.amber.shade700,
                          ),
                          SizedBox(width: 4),
                          Text(
                            DateTimeParse.getTanggalToDisplay(
                              bookmark.tanggalDibookmark.toString(),
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
                ],
              ),
            ),
            // Tombol hapus
            if (onDelete != null)
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.bookmark_remove,
                  color: Colors.red.shade400,
                  size: 20,
                ),
                tooltip: 'Hapus dari bookmark',
              ),
          ],
        ),
      ),
    );
  }
}
