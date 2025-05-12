import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String toFormattedDayString() {
    return DateFormat('ថ្ងៃEEE, ទីd ខែMMM,ឆ្នាំyyyy', 'km').format(this);
  }

  String toFormattedMonthString() {
    return DateFormat('ខែMMM ឆ្នាំyyyy', 'km').format(this);
  }

  String toFormattedYearString() {
    return DateFormat('ឆ្នាំyyyy', 'km').format(this);
  }

  String fromDateTimeToString() {
    return DateFormat('ថ្ងៃទីd  ខែMMM  ឆ្នាំyyyy', 'km').format(this);
  }

  String fromDateTimeToHourClock() {
    return DateFormat('h:mm').format(this);
  }

  String fromDateTimeToMonthAlphabet() {
    switch (this.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'January';
    }
  }

  String formattedUTCDateTime() {
    return DateFormat("yyyy-MM-dd HH:mm:ss.SS '+00:00'").format(this);
  }

// static String toFormattedHHmmDDtoString(String dateTime) {
//   return DateFormat('HH:mm dd/MM/yyyy').format(dateTime);
// }
}

extension StringDateFormatExtension on String {
  String fromDateTimeToString() {
    return DateFormat('ថ្ងៃទីd ខែMMM ឆ្នាំyyyy', 'km').format(DateTime.parse(this));
  }

  String fromDateTimeToHourClock() {
    return DateFormat('HH:mm').format(DateTime.parse(this));
  }
}

extension CheckShiftTimeExtension on String {
  static String checkShiftTime({required DateTime shiftTime}) {
    if (shiftTime.timeZoneName == 'AM') {
      return 'MORNING';
    } else if (shiftTime.timeZoneName == 'PM') {
      return 'AFTERNOON';
    } else {
      return 'MORNING';
    }
  }

  static String checkTime({required DateTime time}) {
    final hour = time.hour;
    if (hour < 12) {
      return 'ព្រឹក';
    } else if (hour > 12) {
      return 'ថ្ងៃ';
    } else {
      return 'ល្ងាច';
    }
  }

  static String checkShiftType({required String shiftType}) {
    if (shiftType == 'MORNING') {
      return 'ព្រឹក';
    } else if (shiftType == 'AFTERNOON') {
      return 'ថ្ងៃ';
    } else {
      return 'ល្ងាច';
    }
  }

  static String checkClockInout({required bool isClockIn}) {
    if (isClockIn) {
      return 'CLOCK-OUT';
    } else {
      return 'CLOCK-IN';
    }
  }

  static String checkClockInoutType({required String clockType}) {
    if (clockType == 'CLOCK-IN') {
      return 'ចូល';
    } else if (clockType == 'CLOCK-OUT') {
      return 'ចេញ';
    } else {
      return 'ចូល';
    }
  }

  static String convertSecondToMinute({required int second}) {
    if (second == 0) {
      return '--,--';
    } else {
      if (second < 3600) {
        return '${(second / 60).floor()} នាទី';
      } else {
        return '${(second / 3600).floor()} ម៉ោង ${(second % 3600 / 60).floor()} នាទី';
      }
    }
  }

  static String convertFromMinute({required int minute}) {
    if (minute == 0) {
      return '--,--';
    } else {
      if (minute < 60) {
        return '${minute} នាទី';
      } else {
        return '${(minute / 60).floor()} ម៉ោង ${(minute % 60).floor()} នាទី';
      }
    }
  }
}
