import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Task {
  Task({
    required this.title,
    required this.time,
    this.description,
    required this.isAllDay,
    required this.recurrenceRule,
    required this.exceptionDates,
    required this.isFinished,
  });
  String title;
  DateTime time;
  Color? background = Colors.blueAccent[900];
  String? description;
  bool isAllDay;
  String? recurrenceRule;
  List<DateTime>? exceptionDates;
  bool isFinished;
}

class TaskDataSource extends CalendarDataSource {
  TaskDataSource(List<Task> source) {
    appointments = source;
  }
}
