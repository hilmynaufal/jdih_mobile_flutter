class DesaModel {
  final String id;
  final String districtId;
  final String name;

  DesaModel({
    required this.id,
    required this.districtId,
    required this.name,
  });

  factory DesaModel.fromJson(Map<String, dynamic> json) {
    return DesaModel(
      id: json['id'],
      districtId: json['district_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "district_id": districtId,
        "name": name,
      };
}
