import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateTimeParse {
  static String parseDateTime(String dateTime) {
    //check if TBA

    final inf = DateFormat("yyyy-MM-dd HH:mm:ss");
    final outf = DateFormat("EEEE, d MMM yyyy HH:mm");

    var inputDate = inf.parse(dateTime);
    var outputDate = outf.format(inputDate);

    return outputDate;
  }

  static String getTrimmedTanggal(String dateTime) {
    final inf = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    final outf = DateFormat("yyyy-MM-dd");

    //check if already trimmed

    if (outf.tryParseStrict(dateTime) != null) {
      return dateTime;
    }

    var inputDate = inf.parse(dateTime);
    var outputDate = outf.format(inputDate);

    return outputDate;
  }

  static String getTrimmedWaktu(String dateTime) {
    final inf = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    final outf = DateFormat("HH:mm");

    //check if already trimmed

    if (outf.tryParseStrict(dateTime) != null) {
      return dateTime;
    }

    var inputDate = inf.parse(dateTime);
    var outputDate = outf.format(inputDate);

    return outputDate;
  }

  static String getTanggalToDisplay(String? dateTime) {
    //check if TBA

    if (dateTime == null || dateTime == "") {
      return "-";
    }

    final inf = DateFormat("yyyy-MM-dd");
    final outf = DateFormat("EEEE, d MMM yyyy");

    var inputDate = inf.parse(dateTime);
    var outputDate = outf.format(inputDate);

    return outputDate;
  }

  static String getWaktuToDisplay(String dateTime) {
    //check if TBA

    final inf = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    final outf = DateFormat("HH:mm");

    var inputDate = inf.parse(dateTime);
    var outputDate = outf.format(inputDate);

    return outputDate;
  }

  // static String getFirstDayInMonth() {
  //   final now = DateTime.now();
  //   final first = DateTime(now.year, now.month - 1, 1);
  //   final inf = DateFormat("yyyy-MM-dd");

  //   return inf.format(first);
  // }

  // static String getNow() {
  //   final inf = DateFormat("yyyyMMdd");
  //   return inf.format(DateTime.now());
  // }

  // static int getDurationInMilisecond(DateTime to) {
  //   final from = DateTime.now();
  //   return to.difference(from).inHours;
  // }

  static String getScheduleDiference(String date) {
    var string = "";

    final to = DateTime.parse(date);

    final from = DateTime.now();
    final days = to.difference(from).inDays;
    final hours = to.difference(from).inHours % 24;
    final minutes = to.difference(from).inMinutes % 60;

    string = "$days Hari, $hours Jam, $minutes Menit";
    return string;
  }
}
