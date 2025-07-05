class LoginModel {
  final String? idUser;
  final String? createTime;
  final String? updateTime;
  final String? visitTime;
  final String? fullname;
  final String? gender;
  final String? birth;
  final String? email;
  final String? username;
  final String? password;
  final String? level;
  final String? division;
  final String? image;
  final String? ipaddress;
  final String? active;
  final String? status;

  LoginModel({
    this.idUser,
    this.createTime,
    this.updateTime,
    this.visitTime,
    this.fullname,
    this.gender,
    this.birth,
    this.email,
    this.username,
    this.password,
    this.level,
    this.division,
    this.image,
    this.ipaddress,
    this.active,
    this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      idUser: json["id_user"],
      createTime: json["create_time"],
      updateTime: json["update_time"],
      visitTime: json["visit_time"],
      fullname: json["fullname"],
      gender: json["gender"],
      birth: json["birth"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      level: json["level"],
      division: json["division"],
      image: json["image"],
      ipaddress: json["ipaddress"],
      active: json["active"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id_user": idUser,
      "create_time": createTime,
      "update_time": updateTime,
      "visit_time": visitTime,
      "fullname": fullname,
      "gender": gender,
      "birth": birth,
      "email": email,
      "username": username,
      "password": password,
      "level": level,
      "division": division,
      "image": image,
      "ipaddress": ipaddress,
      "active": active,
      "status": status,
    };
  }
}
