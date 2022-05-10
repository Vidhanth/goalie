import 'package:goalie/res/strings.dart';
import 'package:intl/intl.dart';

class DateHelper {
  static String getDatabaseDate(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String getDisplayDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat(DateFormat.ABBR_MONTH_DAY);

    if (date.isToday) {
      return todayText;
    }

    if (date.isYesterday) {
      return yesterdayText;
    }

    return formatter.format(date);
  }
}

extension DateExtensions on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}
