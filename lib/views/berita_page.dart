import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/components/artikel_card.dart';
import 'package:jdih_mobile_flutter/components/berita_card.dart';
import 'package:jdih_mobile_flutter/components/dokumen_card.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/controllers/artikel_controller.dart';
import 'package:jdih_mobile_flutter/controllers/berita_controller.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_artikel_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BeritaPage extends StatelessWidget {
  BeritaPage({super.key});

  final controller = Get.find<BeritaController>();

  @override
  Widget build(BuildContext context) {
    controller.getBeritas();

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          "Berita JDIH DPRD",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Container(height: 2, color: Colors.green)),
              Expanded(child: Container(height: 2, color: Colors.blue)),
              Expanded(child: Container(height: 2, color: Colors.yellow)),
              Expanded(child: Container(height: 2, color: Colors.red)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 16),
                // choiceBuilder(theme, textTheme),
                // SizedBox(
                //   height: 8,
                // ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              return Skeletonizer(
                enabled: controller.beritas.isEmpty,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: controller.beritas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: BeritaCard(
                        berita: controller.beritas[index],
                        textTheme: textTheme,
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // Widget choiceBuilder(ThemeData theme, TextTheme textTheme) {
  //   return Choice<String>.inline(
  //     clearable: true,
  //     itemCount: choiceName.length,
  //     onChanged: ChoiceSingle.onChanged((value) {}),
  //     itemBuilder: (state, i) {
  //       return Obx(() {
  //         return InkWell(
  //           onTap: () {
  //             controller.selectedChoice.value = i;

  //             //get berita berdasarkan choice
  //             if (i == 0) {
  //               controller.beritas.clear();
  //               //reset limit
  //               controller.limit = 10;
  //               // controller.page.value = 1;
  //               controller.getBeritas(
  //                 filter: Constant.ARTIKEL_BERITA_CATEGORY_SUB_ID_,
  //                 filterField: Constant.ARTIKEL_FILTER_FIELD,
  //               );
  //             } else {
  //               //reset limit
  //               controller.limit = 10;
  //               controller.beritas.clear();
  //               controller.getBeritas(
  //                 filter: Constant.ARTIKEL_KEGIATAN_CATEGORY_SUB_ID_,
  //                 filterField: Constant.ARTIKEL_FILTER_FIELD,
  //               );
  //             }
  //           },
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  //             decoration: BoxDecoration(
  //               color:
  //                   i == controller.selectedChoice.value
  //                       ? theme.colorScheme.primary
  //                       : theme.colorScheme.secondaryContainer,
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //             child: Text(
  //               choiceName[i],
  //               style: theme.textTheme.bodySmall!.copyWith(
  //                 fontSize: 11,
  //                 color:
  //                     i == controller.selectedChoice.value
  //                         ? theme.colorScheme.onSecondary
  //                         : theme.colorScheme.primary,
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  //     },
  //     listBuilder: ChoiceList.createScrollable(
  //       spacing: 10,
  //       // padding: const EdgeInsets.only(right: 16),
  //     ),
  //   );
  // }

  final List<String> choiceName = ["Berita", "Kegiatan"];
}
