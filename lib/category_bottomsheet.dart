import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/controllers/dokumen_controller.dart';
import 'package:jdih_mobile_flutter/models/category_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBottomsheet extends StatelessWidget {
  CategoryBottomsheet({
    super.key,
    required this.stat,
    required this.category,
    required this.filterField,
  });

  final List<dynamic>? stat;
  final List<CategoryModel> category;
  final controller = Get.find<DokumenController>();
  final String filterField;

  @override
  Widget build(BuildContext context) {
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
            itemCount: category.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.back();
                  //reset limit paginate
                  controller.limit = 10;

                  controller.selectedCategory.value = category.elementAt(index);
                  controller.getListDokumen(
                    filter: category.elementAt(index).idCategorySub!,
                    filterField: filterField,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        category[index].name!,
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
                          stat!
                              .firstWhere(
                                (p0) =>
                                    p0['name'] ==
                                    category.elementAt(index).name!,
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
