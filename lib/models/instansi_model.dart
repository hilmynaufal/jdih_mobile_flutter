class InstansiModel {
  final String? idDepartment;
  final String? name;
  final String? leader;
  final String? address;
  final String? email;
  final String? image;
  final String? website;
  final String? views;
  final String? status;
  final String? type;
  final String? createdId;
  final String? createdDate;
  final String? updateId;
  final String? updateDate;
  final String? instagram;
  final String? facebook;
  final String? youtube;
  final String? twitter;

  InstansiModel({
    this.idDepartment,
    this.name,
    this.leader,
    this.address,
    this.email,
    this.image,
    this.website,
    this.views,
    this.status,
    this.type,
    this.createdId,
    this.createdDate,
    this.updateId,
    this.updateDate,
    this.instagram,
    this.facebook,
    this.youtube,
    this.twitter,
  });

  factory InstansiModel.fromJson(Map<String, dynamic> json) {
    return InstansiModel(
      idDepartment: json["id_department"],
      name: json["name"],
      leader: json["leader"],
      address: json["address"],
      email: json["email"],
      image: json["image"],
      website: json["website"],
      views: json["views"],
      status: json["status"],
      type: json["type"],
      createdId: json["created_id"],
      createdDate: json["created_date"],
      updateId: json["update_id"],
      updateDate: json["update_date"],
      instagram: json["instagram"],
      facebook: json["facebook"],
      youtube: json["youtube"],
      twitter: json["twitter"],
    );
  }
}
