class VisitorStatisticsModel {
  int? todayVisitor;
  int? todayHit;
  int? totalPengunjung;
  String? tanggal;

  VisitorStatisticsModel({
    this.todayVisitor,
    this.todayHit,
    this.totalPengunjung,
    this.tanggal,
  });

  factory VisitorStatisticsModel.fromMap(Map<String, dynamic> json) =>
      VisitorStatisticsModel(
        todayVisitor: json["today_visitor"] is int
            ? json["today_visitor"]
            : int.tryParse(json["today_visitor"]?.toString() ?? "0") ?? 0,
        todayHit: json["today_hit"] is int
            ? json["today_hit"]
            : int.tryParse(json["today_hit"]?.toString() ?? "0") ?? 0,
        totalPengunjung: json["total_pengunjung"] is int
            ? json["total_pengunjung"]
            : int.tryParse(json["total_pengunjung"]?.toString() ?? "0") ?? 0,
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toMap() => {
        "today_visitor": todayVisitor,
        "today_hit": todayHit,
        "total_pengunjung": totalPengunjung,
        "tanggal": tanggal,
      };
}
