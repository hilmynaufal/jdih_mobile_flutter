import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdih_mobile_flutter/components/artikel_card.dart';
import 'package:jdih_mobile_flutter/components/dokumen_card.dart';
import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/controllers/artikel_controller.dart';
import 'package:jdih_mobile_flutter/controllers/home_controller.dart';
import 'package:jdih_mobile_flutter/views/detail_artikel_page.dart';

class ArtikelPage extends StatelessWidget {
  ArtikelPage({super.key});

  final controller = Get.find<ArtikelController>();

  @override
  Widget build(BuildContext context) {
    controller.getBeritas(
      filter: Constant.ARTIKEL_BERITA_CATEGORY_SUB_ID_,
      filterField: Constant.ARTIKEL_FILTER_FIELD,
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     forceMaterialTransparency: true,
      //     title:
      //         Text("Artikel", style: TextStyle(fontWeight: FontWeight.w900))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetX<HomeController>(
              builder: (homeController) {
                return SizedBox(
                  height: 260,
                  child: ListView.builder(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        homeController
                            .beritaTerbaru
                            .length, // Sesuaikan dengan jumlah item yang ingin ditampilkan
                    itemBuilder: (context, index) {
                      final curentArtikel = homeController.beritaTerbaru
                          .elementAt(index);
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => DetailArtikelPage(
                              artikel: homeController.beritaTerbaru.elementAt(
                                index,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: Get.width,
                          child: Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                width: double.infinity,
                                height: 260,
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  // borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(
                                  curentArtikel.imageArticle!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      // borderRadius: BorderRadius.only(
                                      //     bottomRight: Radius.circular(10),
                                      //     bottomLeft: Radius.circular(10))
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    child: Text(
                                      curentArtikel.namaArtikel ?? "",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          width: double.infinity,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 10,
                                color: Colors.amber,
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${200}', // Mengubah teks menjadi dinamis berdasarkan index
                                      style: textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Berita',
                                      style: textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          width: double.infinity,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 10,
                                color: Colors.green,
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${200}', // Mengubah teks menjadi dinamis berdasarkan index
                                      style: textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Kegiatan',
                                      style: textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  SizedBox(height: 32),
                  choiceBuilder(theme, textTheme),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.beritas.length,
                      itemBuilder: (context, index) {
                        return ArtikelCard(
                          artikel: controller.beritas[index],
                          textTheme: textTheme,
                        );
                      },
                    );
                  }),
                  SizedBox(height: 16),
                  Obx(
                    () =>
                        controller.isLoading.value
                            ? Center(child: CircularProgressIndicator())
                            : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.getBeritas(
                                    filter:
                                        controller.selectedChoice.value == 0
                                            ? Constant
                                                .ARTIKEL_BERITA_CATEGORY_SUB_ID_
                                            : Constant
                                                .ARTIKEL_KEGIATAN_CATEGORY_SUB_ID_,
                                    filterField: Constant.ARTIKEL_FILTER_FIELD,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.all(4),
                                  minimumSize: Size(0, 0),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Load More",
                                  style: GoogleFonts.poppins(fontSize: 10),
                                ),
                              ),
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget choiceBuilder(ThemeData theme, TextTheme textTheme) {
    return Choice<String>.inline(
      clearable: true,
      itemCount: choiceName.length,
      onChanged: ChoiceSingle.onChanged((value) {}),
      itemBuilder: (state, i) {
        return Obx(() {
          return InkWell(
            onTap: () {
              controller.selectedChoice.value = i;

              //get berita berdasarkan choice
              if (i == 0) {
                controller.beritas.clear();
                //reset limit
                controller.limit = 10;
                // controller.page.value = 1;
                controller.getBeritas(
                  filter: Constant.ARTIKEL_BERITA_CATEGORY_SUB_ID_,
                  filterField: Constant.ARTIKEL_FILTER_FIELD,
                );
              } else {
                //reset limit
                controller.limit = 10;
                controller.beritas.clear();
                controller.getBeritas(
                  filter: Constant.ARTIKEL_KEGIATAN_CATEGORY_SUB_ID_,
                  filterField: Constant.ARTIKEL_FILTER_FIELD,
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color:
                    i == controller.selectedChoice.value
                        ? theme.colorScheme.primary
                        : theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                choiceName[i],
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 11,
                  color:
                      i == controller.selectedChoice.value
                          ? theme.colorScheme.onSecondary
                          : theme.colorScheme.primary,
                ),
              ),
            ),
          );
        });
      },
      listBuilder: ChoiceList.createScrollable(
        spacing: 10,
        // padding: const EdgeInsets.only(right: 16),
      ),
    );
  }

  final List<String> choiceName = ["Berita", "Kegiatan"];
}
