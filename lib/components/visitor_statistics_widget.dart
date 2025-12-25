import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:intl/intl.dart';

class VisitorStatisticsWidget extends StatelessWidget {
  VisitorStatisticsWidget({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (controller.visitorStatistics.value == null) {
      controller.getVisitorStatistics();
    }

    return Obx(() {
      final statistics = controller.visitorStatistics.value;
      final isLoading = statistics == null;

      return Skeletonizer(
        enabled: isLoading,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(color: Colors.blue, width: 4),
                      SizedBox(width: 4),
                      Text(
                        'Statistik Pengunjung',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Pengunjung Hari Ini
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.people,
                        color: Colors.green,
                        label: 'Pengunjung Hari Ini',
                        value: isLoading
                            ? '0'
                            : NumberFormat('#,###', 'id_ID')
                                .format(statistics!.todayVisitor ?? 0),
                        theme: theme,
                      ),
                    ),
                    SizedBox(width: 8),
                    // Hit Hari Ini
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.touch_app,
                        color: Colors.orange,
                        label: 'Hit Hari Ini',
                        value: isLoading
                            ? '0'
                            : NumberFormat('#,###', 'id_ID')
                                .format(statistics!.todayHit ?? 0),
                        theme: theme,
                      ),
                    ),
                    SizedBox(width: 8),
                    // Total Pengunjung
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.groups,
                        color: Colors.purple,
                        label: 'Total Pengunjung',
                        value: isLoading
                            ? '0'
                            : NumberFormat('#,###', 'id_ID')
                                .format(statistics!.totalPengunjung ?? 0),
                        theme: theme,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              if (!isLoading && statistics!.tanggal != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Update: ${_formatDateTime(statistics.tanggal!)}',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 16),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color color,
    required String label,
    required String value,
    required ThemeData theme,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      final formatter = DateFormat('dd MMM yyyy HH:mm', 'id_ID');
      return formatter.format(dateTime);
    } catch (e) {
      return dateTimeStr;
    }
  }
}
