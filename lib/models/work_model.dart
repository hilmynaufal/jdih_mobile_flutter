class WorkModel {
  final String idJob;
  final String createdDate;
  final String? updateDate;
  final String createdId;
  final String updateId;
  final String name;
  final String status;

  WorkModel({
    required this.idJob,
    required this.createdDate,
    this.updateDate,
    required this.createdId,
    required this.updateId,
    required this.name,
    required this.status,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      idJob: json['id_job'],
      createdDate: json['created_date'],
      updateDate: json['update_date'],
      createdId: json['created_id'],
      updateId: json['update_id'],
      name: json['name'],
      status: json['status'],
    );
  }
}