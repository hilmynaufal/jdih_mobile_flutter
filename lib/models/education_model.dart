class EducationModel {
  final String idEducation;
  final String createdDate;
  final String? updateDate;
  final String createdId;
  final String? updateId;
  final String name;
  final String status;

  EducationModel({
    required this.idEducation,
    required this.createdDate,
    this.updateDate,
    required this.createdId,
    this.updateId,
    required this.name,
    required this.status,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      idEducation: json['id_education'],
      createdDate: json['created_date'],
      updateDate: json['update_date'],
      createdId: json['created_id'],
      updateId: json['update_id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
