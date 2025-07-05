class StatModel {
  List<Map<String, String>>? jenisInformasi;
  List<Map<String, String>>? jenisDokumen;
  List<Map<String, String>>? jenisPpid;

  StatModel({
    this.jenisInformasi,
    this.jenisDokumen,
    this.jenisPpid,
  });

  factory StatModel.fromMap(Map<String, dynamic> json) => StatModel(
        jenisInformasi: json["jenis_informasi"] == null
            ? []
            : List<Map<String, String>>.from(
                json["jenis_informasi"]!.map((x) => Map.from(x))),
        jenisDokumen: json["jenis_dokumen"] == null
            ? []
            : List<Map<String, String>>.from(
                json["jenis_dokumen"]!.map((x) => Map.from(x))),
        jenisPpid: json["jenis_ppid"] == null
            ? []
            : List<Map<String, String>>.from(
                json["jenis_ppid"]!.map((x) => Map.from(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "jenis_informasi": jenisInformasi == null ? [] : List<dynamic>.from(jenisInformasi!.map((x) => x.toMap())),
  //     "jenis_dokumen": jenisDokumen == null ? [] : List<dynamic>.from(jenisDokumen!.map((x) => x.toMap())),
  //     "jenis_ppid": jenisPpid == null ? [] : List<dynamic>.from(jenisPpid!.map((x) => x.toMap())),
  // };
}
