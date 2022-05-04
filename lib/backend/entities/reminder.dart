import 'dart:ui';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class Reminder {
  Reminder(this.title, this.note, this.from, this.color, this.isAllDay);

  String title;
  String note;
  DateTime from;
  Color color;
  bool isAllDay;
}

class ReminderDataSource extends CalendarDataSource {
  ReminderDataSource(List<Reminder> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return getStartTime(index).add(Duration(minutes: 10));
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }
}
