class UserModel {
  String? idUser;
  String? createTime;
  String? updateTime;
  String? visitTime;
  String? verifiedTime;
  String? code;
  String? familyCode;
  String? fullname;
  String? gender;
  String? birth;
  String? phone;
  String? email;
  String? username;
  String? password;
  String? description;
  String? level;
  String? division;
  String? image;
  String? ipaddress;
  String? active;
  String? statusAccount;
  String? token;
  String? provinceId;
  String? regencyId;
  String? districtId;
  String? villageId;
  String? rtId;
  String? rwId;
  String? verifiedEmail;
  String? googleId;
  String? googleImage;
  String? educationId;
  String? workId;
  String? workName;
  String? workDivision;

  UserModel({
    this.idUser,
    this.createTime,
    this.updateTime,
    this.visitTime,
    this.verifiedTime,
    this.code,
    this.familyCode,
    this.fullname,
    this.gender,
    this.birth,
    this.phone,
    this.email,
    this.username,
    this.password,
    this.description,
    this.level,
    this.division,
    this.image,
    this.ipaddress,
    this.active,
    this.statusAccount,
    this.token,
    this.provinceId,
    this.regencyId,
    this.districtId,
    this.villageId,
    this.rtId,
    this.rwId,
    this.verifiedEmail,
    this.googleId,
    this.googleImage,
    this.educationId,
    this.workId,
    this.workName,
    this.workDivision,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json["id_user"],
      createTime: json["create_time"],
      updateTime: json["update_time"],
      visitTime: json["visit_time"],
      verifiedTime: json["verified_time"],
      code: json["code"],
      familyCode: json["family_code"],
      fullname: json["fullname"],
      gender: json["gender"],
      birth: json["birth"],
      phone: json["phone"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      description: json["description"],
      level: json["level"],
      division: json["division"],
      image: json["image"],
      ipaddress: json["ipaddress"],
      active: json["active"],
      statusAccount: json["status_account"],
      token: json["token"],
      provinceId: json["province_id"],
      regencyId: json["regency_id"],
      districtId: json["district_id"],
      villageId: json["village_id"],
      rtId: json["rt_id"],
      rwId: json["rw_id"],
      verifiedEmail: json["verified_email"],
      googleId: json["google_id"],
      googleImage: json["google_image"],
      educationId: json["education_id"],
      workId: json["work_id"],
      workName: json["work_name"],
      workDivision: json["work_division"],
    );
  }

  Map<String, String?> toMap() {
    return {
      "id_user": idUser,
      "create_time": createTime,
      "update_time": updateTime,
      "visit_time": visitTime,
      "verified_time": verifiedTime,
      "code": code,
      "family_code": familyCode,
      "fullname": fullname,
      "gender": gender,
      "birth": birth,
      "phone": phone,
      "email": email,
      "username": username,
      "password": password,
      "description": description,
      "level": level,
      "division": division,
      "image": image,
      "ipaddress": ipaddress,
      "active": active,
      "status_account": statusAccount,
      "token": token,
      "province_id": provinceId,
      "regency_id": regencyId,
      "district_id": districtId,
      "village_id": villageId,
      "rt_id": rtId,
      "rw_id": rwId,
      "verified_email": verifiedEmail,
      "google_id": googleId,
      "google_image": googleImage,
      "education_id": educationId,
      "work_id": workId,
      "work_name": workName,
      "work_division": workDivision,
    };
  }
}
