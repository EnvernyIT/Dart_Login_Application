import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:sampleapp/backend/entities/verlof.dart';
import 'package:sampleapp/pages/mailpage.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../backend/api/NotificationApi.dart';
import '../backend/entities/event.dart';
import '../backend/entities/task.dart';
import 'components/navbar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({
    Key? key,
  }) : super(
          key: key,
        );
  static const String routeName = '/calender';
  static const String title = "CALENDER";

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  final isDialOpen = ValueNotifier(false);
  final List<Event> meetings = <Event>[];

  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(CalenderPage.title),
        actions: [
          IconButton(
            onPressed: () => NotificationApi.showScheduledNotification(
                title: "Jeremy@bludots.com",
                body:
                    'Ik ben gisteren geweest bij de firm. Mijn antwoord was dat ik nergens anders mocht transferen. Alleen binnen',
                payload: 'Jeremy@bludots.com',
                scheduledDate: DateTime.now().add(Duration(seconds: 15))),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
        foregroundColor: RainbowTheme.primary_1,
        bottomOpacity: 0,
        backgroundColor: RainbowTheme.secondary,
      ),
      drawer: NavBar(),
      body: SfCalendar(
        todayHighlightColor: RainbowTheme.primary_1,
        cellBorderColor: RainbowTheme.primary_1,
        view: CalendarView.month,
        allowViewNavigation: true,
        dataSource: EventDataSource(_getDataSource()),
        monthViewSettings: const MonthViewSettings(
          monthCellStyle: MonthCellStyle(
            trailingDatesBackgroundColor: RainbowTheme.hint,
            leadingDatesBackgroundColor: RainbowTheme.hint,
          ),
          showTrailingAndLeadingDates: false,
          dayFormat: 'EEE',
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
          agendaViewHeight: 250,
          agendaItemHeight: 50,
          agendaStyle: AgendaStyle(
            backgroundColor: RainbowTheme.secondary,
            appointmentTextStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            dateTextStyle: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            dayTextStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        firstDayOfWeek: 1,
        showNavigationArrow: true,
        cellEndPadding: 5,
        showWeekNumber: true,
        weekNumberStyle: WeekNumberStyle(
            backgroundColor: RainbowTheme.primary_1,
            textStyle: TextStyle(color: Colors.white, fontSize: 14)),
        // onTap: calendarTapped,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        icon: Icons.add,
        backgroundColor: RainbowTheme.primary_1,
        foregroundColor: RainbowTheme.secondary,
        activeBackgroundColor: RainbowTheme.secondary,
        activeForegroundColor: RainbowTheme.primary_1,
        overlayColor: RainbowTheme.primary_1,
        overlayOpacity: 0.4,
        spacing: 10,
        spaceBetweenChildren: 10,
        animationSpeed: 150,
        closeManually: false,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.addAbsence),
            backgroundColor: RainbowTheme.secondary,
            foregroundColor: RainbowTheme.primary_1,
            child: const Icon(Icons.calendar_month_outlined),
            label: 'Absence',
          ),
          SpeedDialChild(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.addMeeting),
            backgroundColor: RainbowTheme.secondary,
            foregroundColor: RainbowTheme.primary_1,
            child: const Icon(Icons.meeting_room_outlined),
            label: 'Meeting',
          ),
          SpeedDialChild(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.addTask),
            backgroundColor: RainbowTheme.secondary,
            foregroundColor: RainbowTheme.primary_1,
            child: const Icon(Icons.task),
            label: 'Task',
          ),
          SpeedDialChild(
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.addReminder),
            backgroundColor: RainbowTheme.secondary,
            foregroundColor: RainbowTheme.primary_1,
            child: const Icon(
              Icons.notification_add_outlined,
            ),
            label: 'Reminder',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    NotificationApi.init(initScheduled: true);
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) {
    Navigator.pushReplacementNamed(context, Routes.mail);
  }

  List<Event> _getDataSource() {
    final DateTime today = DateTime.now();
    final DateTime from = DateTime.now().add(Duration(days: 5));
    meetings.add(Event(
        'Conference Meeting',
        "A meeting met de collega's",
        "Meeting",
        DateTime(today.year, today.month, today.day, 9, 0, 0),
        DateTime(today.year, today.month, today.day, 11, 0, 0),
        const Color(0xFF0F8644),
        false));
    meetings.add(Event(
        'Verlof',
        "Ziekteverlof - Covid.",
        "Absence",
        DateTime(
          from.year,
          5,
          2,
        ),
        DateTime(
          from.year,
          5,
          6,
        ).add(Duration(days: 7)),
        Color.fromARGB(255, 222, 9, 9),
        false));
    meetings.add(Event(
        'Scrum Meeting',
        "A meeting met de teamsleden over project.",
        "Meeting",
        DateTime(from.year, from.month, from.day, 9, 0, 0),
        DateTime(from.year, from.month, from.day, 12, 0, 0),
        const Color(0xFF0F8644),
        false));
    meetings.add(Event(
        'Document Hr opsturen',
        "Documentatie Opsturen naar HR.",
        "Task",
        DateTime(from.year, 4, 27, 9, 0, 0),
        DateTime(from.year, 4, 27, 9, 0, 0),
        const Color.fromARGB(255, 11, 106, 178),
        false));

    return meetings;
  }

  Widget mailListObject(
      String picture, String from, String mail, DateTime date, bool read) {
    var monthFormat = DateFormat("MMM");
    var dayFormat = DateFormat("dd");
    return Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: (() {
              if (read) {
                return const Color.fromARGB(255, 233, 233, 233);
              }
              return Colors.white;
            }()),
            border: Border.all(
              width: 2,
              color: (() {
                if (read) {
                  return const Color.fromARGB(255, 233, 233, 233);
                }
                return Colors.white;
              }()),
            )),
        alignment: Alignment.center,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
                onLongPress: () {},
                onTap: () {},
                child: Row(children: [
                  const SizedBox(
                    width: 5.0,
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(picture),
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 240,
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            children: [
                              Text(
                                from,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                (() {
                                  if (mail.length >= 35) {
                                    return mail.substring(0, 35) + ".......";
                                  }
                                  return mail;
                                }()),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(monthFormat.format(date).toString() +
                          " " +
                          dayFormat.format(date).toString())
                    ],
                  ),
                  const Divider(
                    height: 20,
                    color: Colors.black,
                  )
                ]))
          ],
        ));
  }
}
