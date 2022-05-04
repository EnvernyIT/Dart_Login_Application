import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Verlof {
  Verlof({
    required this.type,
    required this.reason,
    required this.from,
    required this.to,
  });
  String type;
  String reason;
  DateTime from;
  DateTime to;
  Color background = Colors.blueAccent;
}

class VerlofDataSource extends CalendarDataSource {
  VerlofDataSource(List<Verlof> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return "Verlof-" + appointments![index].reason;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
