import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

class Helper {
  static String getLanguageName(String languageCode) {
    if (isoLangs.containsKey(languageCode)) {
      return isoLangs[languageCode]!["name"] ?? "";
    } else {
      return languageCode;
    }
  }

  static String formatDateTime(DateTime dateTime) {
    final format = DateFormat('E, d MMM yy');
    return format.format(dateTime.add(_utcPlus7));
  }

  static String addHoursToTime(String? time) {
    if (time == null) return "";
    DateFormat format = DateFormat('HH:mm');
    DateTime dateTime = format.parse(time);

    DateTime updatedDateTime = dateTime.add(const Duration(hours: 7));

    String updatedTime = format.format(updatedDateTime);

    return updatedTime;
  }

  static DateTime timeStampToDateTime(int? epoch) {
    if (epoch == null) return DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(epoch);
  }

  static int? timeToMilliseconds(DateTime? date, TimeOfDay? time) {
    if (time == null || date == null) return null;
    DateTime dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return dateTime.millisecondsSinceEpoch;
  }

  static String timeStampToHoursMinutes(int epoch) {
    return hsFormatter.format(DateTime.fromMillisecondsSinceEpoch(epoch));
  }

  static double getSize(BuildContext context, double percent,
      {bool isHeight = false}) {
    final size = isHeight
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
    return size * percent / 100.0;
  }

  static const _utcPlus7 = Duration(hours: 7);
  static final formatter = DateFormat('MM-dd-yyyy HH:mm');
  static final dmyhmFormatter = DateFormat('dd/MM/yyyy HH:mm');
  static final dmyFormatter = DateFormat('dd/MM/yyyy');
  static final hsFormatter = DateFormat("HH:mm");

  static String get currentDateTime {
    final DateTime now = DateTime.now().toLocal();
    return formatter.format(now);
  }

  static String dateTimeFullTime(DateTime? time) {
    // return time == null ? "" : dmyhmFormatter.format(time.toLocal());
    return time == null ? "" : dmyhmFormatter.format(time.add(_utcPlus7));
  }

  static String dateTimeToDate(DateTime? time) {
    return time == null ? "" : dmyFormatter.format(time.toLocal());
    // return time == null ? "" : dmyFormatter.format(time.add(_utcPlus7));
  }

  static String dateTimeToTime(DateTime? time) {
    // return time == null ? "" : hsFormatter.format(time.toLocal());
    return time == null ? "" : hsFormatter.format(time.add(_utcPlus7));
  }
}
