class KecamatanModel {
  final String id;
  final String regencyId;
  final String name;

  KecamatanModel({
    required this.id,
    required this.regencyId,
    required this.name,
  });

  factory KecamatanModel.fromJson(Map<String, dynamic> json) {
    return KecamatanModel(
      id: json['id'],
      regencyId: json['regency_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'regency_id': regencyId,
      'name': name,
    };
  }
}
