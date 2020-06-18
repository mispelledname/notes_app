import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/util/constants.dart';
import 'package:flutter/material.dart';

/// Service to format the date and time 
/// 
class FormatDateTime {

  FormatDateTime() {
  }

  /// convert integer months to text
  String toMonth(int month) {
    switch (month) {
      case 1: return "Jan";
      case 2: return "Feb";
      case 3: return "Mar";
      case 4: return "Apr";
      case 5: return "May";
      case 6: return "Jun";
      case 7: return "Jul";
      case 8: return "Aug";
      case 9: return "Sep";
      case 10: return "Oct";
      case 11: return "Nov";
      case 12: return "Dec";
      default: return "";
    }
  }

  /// display integers with two digits 
  String toDoubleDigits(int n) {
    String num = n.toString();
    return (num.length < 2)? "0"+num : num; 
  }

  /// default format type
  /// 
  /// MMM DD YYYY, HH:MM
  String fullString(DateTime dateTime) {
    int day = dateTime.day;
    int month = dateTime.month; 
    int year = dateTime.year; 
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    return (
      this.toMonth(month).toUpperCase() + Constants.space + 
      '${day.toString()}' + Constants.space + 
      '${year.toString()}' + Constants.comma + Constants.space + 
      this.toDoubleDigits(hour) + Constants.colon + 
      this.toDoubleDigits(minute)
    );
  }

  /// truncated format type
  /// 
  /// MMM DD
  String truncatedString(DateTime dateTime) {
    int day = dateTime.day;
    int month = dateTime.month; 
    return (
      this.toMonth(month) + Constants.space + 
      '${day.toString()}'
    );
  }

  /// default format type widget
  /// 
  /// MMM DD YYYY, HH:MM
  Widget fullStringWidget(DateTime dateTime) {
    return Text(
      this.fullString(dateTime), 
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: Colors.black54,
          fontSize: 12, 
          fontWeight: FontWeight.w700,
        )
      )
    );
  }
}