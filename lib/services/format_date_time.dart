class FormatDateTime {

  FormatDateTime() {
  }

  // default format type
  String fullString(DateTime dateTime) {
    int day = dateTime.day;
    int month = dateTime.month; 
    int year = dateTime.year; 
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    return '${day.toString()}';
  }

  // truncated date time
  String truncatedString(DateTime dateTime) {
    return '';
  }
}