class CategoryModel {
  String? idCategorySub;
  String? categoryId;
  String? name;
  dynamic image;
  String? url;
  String? status;

  CategoryModel({
    this.idCategorySub,
    this.categoryId,
    this.name,
    this.image,
    this.url,
    this.status,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        idCategorySub: json["id_category_sub"],
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
        url: json["url"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id_category_sub": idCategorySub,
        "category_id": categoryId,
        "name": name,
        "image": image,
        "url": url,
        "status": status,
      };
}
