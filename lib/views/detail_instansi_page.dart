import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:jdih_mobile_flutter/constant.dart';
import 'package:jdih_mobile_flutter/controllers/detail_instansi_controller.dart';

import 'package:jdih_mobile_flutter/models/instansi_model.dart';

class DetailInstansiPage extends StatefulWidget {
  DetailInstansiPage({super.key, required this.instansi});

  final InstansiModel instansi;

  @override
  State<DetailInstansiPage> createState() => _DetailInstansiPageState();
}

class _DetailInstansiPageState extends State<DetailInstansiPage> {
  final controller = Get.put(DetailInstansiController());

  @override
  Widget build(BuildContext context) {
    controller.getCategory(
      categoryId: widget.instansi.idDepartment ?? '',
      filterField: Constant.INSTANSI_FILTER_FIELD,
      jenisStat: Constant.JENIS_DOKUMEN_STATISTIK_CODE,
    );

    final theme = Get.theme;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              floating: false,
              // backgroundColor: theme.primaryColor,
              snap: false,
              expandedHeight: 300,
              foregroundColor: theme.colorScheme.onPrimary,
              toolbarHeight: 40,
              pinned: true,
              titleSpacing: 8,
              primary: true,
              // collapsedHeight: 40,
              centerTitle: true,
              // title: Row(
              //   children: [
              //     Icon(Icons.mail),
              //     SizedBox(
              //       width: 8,
              //     ),
              //     Text("title"),
              //   ],
              // ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          color: theme.primaryColor,
                        ),
                        width: double.infinity,
                        height: 120,
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(
                                CupertinoIcons.building_2_fill,
                                size: 32,
                              ),
                              radius: 32,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.instansi.name?.toUpperCase() ?? "",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Obx(() {
                                    return Text(
                                      "${controller.dokumens.length} dokumen • 0 berita • 0 video",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  iconSize: 12,
                                ),
                                icon: const FaIcon(FontAwesomeIcons.facebookF),
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  iconSize: 12,
                                ),
                                icon: FaIcon(FontAwesomeIcons.youtube),
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.brown,
                                  iconSize: 12,
                                ),
                                icon: FaIcon(FontAwesomeIcons.instagram),
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  iconSize: 12,
                                ),
                                icon: FaIcon(FontAwesomeIcons.xTwitter),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Container(
                  color: theme.scaffoldBackgroundColor,
                  child: TabBar(
                    // controller: TabController(length: 2, vsync: this),
                    // indicator: UnderlineTabIndicator(),
                    // indicatorColor: ,
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    // padding: EdgeInsets.zero,
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                    tabs: const [
                      Tab(text: "DOKUMEN"),
                      Tab(text: "BERITA"),
                      Tab(text: "KEGIATAN"),
                      Tab(text: "VIDEO"),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              // fillOverscroll: true,
              hasScrollBody: true,
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Obx(
                          () =>
                              controller.categories.isEmpty
                                  ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                  : Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.bottomSheet(
                                          detailInstansiCategoryBottomsheet(),
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Obx(
                                              () => Text(
                                                controller
                                                            .selectedCategory
                                                            .value ==
                                                        null
                                                    ? '-'
                                                    : controller
                                                            .selectedCategory
                                                            .value
                                                            ?.name ??
                                                        "-",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                              child: Obx(
                                                () =>
                                                    controller
                                                                    .selectedCategory
                                                                    .value !=
                                                                null &&
                                                            controller
                                                                .stat
                                                                .isNotEmpty
                                                        ? Text(
                                                          controller.stat
                                                              .firstWhere(
                                                                (p0) =>
                                                                    p0['name'] ==
                                                                    controller
                                                                        .selectedCategory
                                                                        .value!
                                                                        .name,
                                                              )['total']
                                                              .toString(),
                                                          style:
                                                              GoogleFonts.poppins(
                                                                fontSize: 8,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                        )
                                                        : const SizedBox(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                        ),
                        // Obx(
                        //   () => Skeletonizer(
                        //     enabled: controller.filteredDokumens.isEmpty,
                        //     child: ListView.builder(
                        //       physics: const NeverScrollableScrollPhysics(),
                        //       shrinkWrap: true,
                        //       itemCount: controller.filteredDokumens.length,
                        //       itemBuilder: (context, index) {
                        //         return InkWell(
                        //           onTap: () {
                        //             // Get.to(
                        //             //   () => DetailDokumenPage(
                        //             //     dokumen: controller.filteredDokumens
                        //             //         .elementAt(index),
                        //             //   ),
                        //             // );
                        //           },
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //               horizontal: 16,
                        //             ),
                        //             child: DokumenCard(
                        //               dokumen: controller.filteredDokumens
                        //                   .elementAt(index),
                        //               textTheme: Get.theme.textTheme,
                        //               type:
                        //                   Constant.JENIS_DOKUMEN_STATISTIK_CODE,
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 32,
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailInstansiCategoryBottomsheet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Center(
            child: Container(
              width: 70,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Pilih Jenis Data",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.back();
                  //reset limit paginate
                  controller.limit = 10;

                  controller.selectedCategory.value = controller.categories
                      .elementAt(index);

                  //filter locally
                  controller.filterDokumen();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        controller.categories[index].name!,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Text(
                          controller.stat
                              .firstWhere(
                                (p0) =>
                                    p0['name'] ==
                                    controller.categories
                                        .elementAt(index)
                                        .name!,
                              )['total']
                              .toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
